part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSignIn = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 100,
                      child: Image.asset("assets/logo.png"),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      child: Text("Welcome !",
                          style: blackTextFont.copyWith(fontSize: 24)),
                    ),
                    TextField(
                      onChanged: (text) {
                        setState(() {
                          isEmailValid = EmailValidator.validate(text);
                        });
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          labelText: "Email Address",
                          hintText: "Your Email Address"),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      onChanged: (text) {
                        setState(() {
                          isPasswordValid = text.length >= 6;
                        });
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          labelText: "Password",
                          hintText: "Your Password"),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text("Forgot Password ? ",
                            style: blackTextFont.copyWith(
                                fontWeight: FontWeight.w400)),
                        Text("Get Now",
                            style: yellowTextFont.copyWith(
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    Center(
                        child: Container(
                      width: double.infinity,
                      height: 60,
                      margin: EdgeInsets.only(top: 40, bottom: 10),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0)),
                          child: Text("Sign In",
                              style: blackTextFont.copyWith(fontSize: 16)),
                          color: mainColor,
                          onPressed: isEmailValid && isPasswordValid
                              ? () async {
                                  setState(() {
                                    isSignIn = true;
                                  });

                                  SignInSignUpResult result =
                                      await AuthServices.signIn(
                                          emailController.text,
                                          passwordController.text);
                                  if (result.user == null) {
                                    setState(() {
                                      isSignIn = false;
                                    });

                                    Flushbar(
                                      duration: Duration(seconds: 4),
                                      flushbarPosition: FlushbarPosition.TOP,
                                      backgroundColor: Colors.redAccent,
                                      message: result.message,
                                    )..show(context);
                                  }
                                }
                              : null),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Start Fresh Now ? ",
                            style: blackTextFont.copyWith(
                                fontWeight: FontWeight.w400)),
                        GestureDetector(
                            child: Text("Sign Up",
                                style: yellowTextFont.copyWith(
                                    fontWeight: FontWeight.w400)),
                            onTap: () {
                              context.bloc<PageBloc>().add(
                                  GoToRegistrationPage(RegistrationData()));
                            }),
                      ],
                    ),
                    SizedBox(height: 40),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
