part of 'pages.dart';

class AccountConfirmPage extends StatefulWidget {
  final RegistrationData regData;

  const AccountConfirmPage(this.regData);

  @override
  _AccountConfirmPageState createState() => _AccountConfirmPageState();
}

class _AccountConfirmPageState extends State<AccountConfirmPage> {
  bool isSignUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          context.bloc<PageBloc>().add(GoToPreferencePage(widget.regData));
          return;
        },
        child: Scaffold(
            body: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: ListView(children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 56,
                          margin: EdgeInsets.only(top: 20, bottom: 90),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                child: GestureDetector(
                                    onTap: () {
                                      context.bloc<PageBloc>().add(
                                          GoToPreferencePage(widget.regData));
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: blackColor,
                                    )),
                                alignment: Alignment.centerLeft,
                              ),
                              Center(
                                  child: Text("Create New\nYour Account",
                                      style: blackTextFont.copyWith(
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center))
                            ],
                          )),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: (widget.regData.profileImage == null)
                                    ? AssetImage("assets/user_pic.png")
                                    : FileImage(widget.regData.profileImage),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Welcome",
                        style:
                            blackTextFont.copyWith(fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "${widget.regData.name}",
                        style: blackTextFont.copyWith(fontSize: 20),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      (isSignUp)
                          ? SpinKitFadingCircle(
                              color: mainColor,
                              size: 45,
                            )
                          : Center(
                              child: Container(
                              width: double.infinity,
                              height: 60,
                              margin: EdgeInsets.only(bottom: 10),
                              child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0)),
                                  child: Text("Sign In",
                                      style:
                                          blackTextFont.copyWith(fontSize: 16)),
                                  color: mainColor,
                                  onPressed: () async {
                                    setState(() {
                                      isSignUp = true;
                                    });
                                    imageFileToUpload =
                                        widget.regData.profileImage;
                                    SignInSignUpResult result =
                                        await AuthServices.signUp(
                                            widget.regData.email,
                                            widget.regData.password,
                                            widget.regData.name,
                                            widget.regData.selectedGenre,
                                            widget.regData.selectedLanguage);
                                    if (result.user == null) {
                                      setState(() {
                                        isSignUp = false;
                                      });

                                      Flushbar(
                                        duration: Duration(seconds: 4),
                                        flushbarPosition: FlushbarPosition.TOP,
                                        backgroundColor: Colors.redAccent,
                                        message: result.message,
                                      )..show(context);
                                    }
                                  }),
                            ))
                    ],
                  )
                ]))));
  }
}
