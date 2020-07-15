part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: Column(
          children: <Widget>[
            Flexible(flex: 1, child: Container()),
            Flexible(
                flex: 1,
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "FaT",
                        style: logoText.copyWith(fontSize: 70),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 56),
                      child: Text(
                        "Fake Ticket",
                        style: blackTextFont.copyWith(fontSize: 24),
                      ),
                    ),
                  ],
                ))),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    width: double.infinity,
                    height: 60,
                    margin: EdgeInsets.only(bottom: 50),
                    child: RaisedButton(
                        child: Text("Get Started",
                            style: yellowTextFont.copyWith(fontSize: 20)),
                        color: blackColor,
                        onPressed: () {
                          context.bloc<PageBloc>().add(GoToLoginPage());
                        }),
                  ),
                ],
              ),
            )
          ],
        ));

    // Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //
    //       Container(
    //         margin: EdgeInsets.only(top: 10, bottom: 16),
    //         child: Text(
    //           "Fake Ticket",
    //           style: blackTextFont.copyWith(fontSize: 36),
    //         ),
    //       ),
    //       Container(
    //         padding: EdgeInsets.only(left: 20, right: 20),
    //         width: double.infinity,
    //         height: 40,
    //         margin: EdgeInsets.only(bottom: 19),
    //         child: RaisedButton(
    //             child: Text("Get Started",
    //                 style: yellowTextFont.copyWith(fontSize: 16)),
    //             color: blackColor,
    //             onPressed: () {}),
    //       ),
    //     ],
    //   ),
    // ));
  }
}
