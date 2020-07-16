part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final RegistrationData regData;
  final List<String> genres = [
    "Horror",
    "Romance",
    "School",
    "Drama",
    "Crime",
    "Science"
  ];
  final List<String> languages = [
    "Indonesia",
    "Jepang",
    "Sambas",
    "German",
    "Korean",
    "Jawa"
  ];

  PreferencePage(this.regData);

  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> selectedGenres = [];

  bool isGenreValid = false;
  String selectedLanguage = "Indonesia";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.regData.password = "";
        context.bloc<PageBloc>().add(GoToRegistrationPage(widget.regData));
        return;
      },
      child: Scaffold(
          body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    height: 56,
                    margin: EdgeInsets.only(top: 20, bottom: 4),
                    child: GestureDetector(
                        onTap: () {
                          widget.regData.password = "";

                          context
                              .bloc<PageBloc>()
                              .add(GoToRegistrationPage(widget.regData));
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: blackColor,
                        ))),
                Text(
                  "Select Your\nFavorite Genres",
                  style: blackTextFont.copyWith(fontSize: 20),
                ),
                Text(
                  "Minimal choise 4",
                  style: blackTextFont.copyWith(fontSize: 10),
                ),
                SizedBox(
                  height: 16,
                ),
                Wrap(
                  spacing: 24,
                  runSpacing: 10,
                  children: generateGenreWidgets(context),
                ),
                SizedBox(
                  height: 26,
                ),
                Text(
                  "Select Your\nFilm Language",
                  style: blackTextFont.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 16,
                ),
                Wrap(
                  spacing: 24,
                  runSpacing: 10,
                  children: generateLangWidgets(context),
                ),
                SizedBox(
                  height: 26,
                ),
                Center(
                    child: Container(
                  width: double.infinity,
                  height: 60,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Text("Next",
                          style: blackTextFont.copyWith(fontSize: 16)),
                      color: mainColor,
                      onPressed: (isGenreValid)
                          ? () {
                              widget.regData.selectedGenre = selectedGenres;
                              widget.regData.selectedLanguage =
                                  selectedLanguage;
                              context.bloc<PageBloc>().add(
                                  GoToAccountConfirmationPage(widget.regData));
                            }
                          : null),
                )),
                SizedBox(
                  height: 26,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  List<Widget> generateGenreWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;
    return widget.genres
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedGenres.contains(e),
              onTap: () {
                onSelectedGenre(e);
              },
            ))
        .toList();
  }

  void onSelectedGenre(String genre) {
    if (selectedGenres.contains(genre)) {
      setState(() {
        selectedGenres.remove(genre);
      });
      isGenreValid = false;
    } else {
      if (selectedGenres.length < 4) {
        isGenreValid = false;
        setState(() {
          selectedGenres.add(genre);
        });
        if (selectedGenres.length == 4) {
          isGenreValid = true;
        }
      }
    }
  }

  List<Widget> generateLangWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;
    return widget.languages
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedLanguage == e,
              onTap: () {
                setState(() {
                  selectedLanguage = e;
                });
              },
            ))
        .toList();
  }
}
