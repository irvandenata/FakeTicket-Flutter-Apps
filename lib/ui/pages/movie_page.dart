part of "pages.dart";

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xffe5e5e5),

                offset: Offset(0, 1), // changes position of shadow
              )
            ],
            //] changes position of shadow
          ),
          padding: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
          child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
            if (userState is UserLoaded) {
              if (imageFileToUpload != null) {
                print("masuk sini");
                uploadImage(imageFileToUpload).then((downloadURL) {
                  imageFileToUpload = null;
                  print(downloadURL);
                  context
                      .bloc<UserBloc>()
                      .add(UpdateUser(profileImage: downloadURL));
                });
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: whiteColor, width: 2)),
                    child: Stack(
                      children: <Widget>[
                        SpinKitFadingCircle(
                          color: mainColor,
                          size: 35,
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: (userState.user.profilePicture == "")
                                      ? AssetImage("assets/user_pic.png")
                                      : NetworkImage(
                                          userState.user.profilePicture),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 5),
                      SizedBox(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin -
                              78,
                          child: Text(
                            userState.user.name,
                            style: blackTextFont.copyWith(fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          )),
                      Text(
                        NumberFormat.currency(
                                locale: "id_ID",
                                decimalDigits: 0,
                                symbol: "IDR ")
                            .format(userState.user.balance),
                        style: yellowNumberFont.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                ],
              );
            } else {
              return SpinKitFadingCircle(
                color: mainColor,
                size: 30,
              );
            }
          }),
        ),
        RaisedButton(
            child: Text("Sign Out"),
            onPressed: () async {
              await AuthServices.signOut();
              context.bloc<PageBloc>().add(GoToLoginPage());
            }),
      ],
    );
  }
}
