part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationData regData;

  const SignUpPage(this.regData);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  void initState() {
    super.initState();

    nameController.text = widget.regData.name;
    emailController.text = widget.regData.email;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          context.bloc<PageBloc>().add(GoToLoginPage());
        },
        child: Scaffold(
            body: Container(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            height: 56,
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  child: GestureDetector(
                                      onTap: () {
                                        context
                                            .bloc<PageBloc>()
                                            .add(GoToLoginPage());
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
                          height: 104,
                          width: 90,
                          child: Center(
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: (widget.regData.profileImage ==
                                                  null)
                                              ? AssetImage(
                                                  "assets/user_pic.png")
                                              : FileImage(
                                                  widget.regData.profileImage),
                                          fit: BoxFit.cover)),
                                ),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        height: 28,
                                        width: 28,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage((widget
                                                            .regData
                                                            .profileImage ==
                                                        null)
                                                    ? "assets/btn_add_photo.png"
                                                    : "assets/btn_del_photo.png"))),
                                        child: GestureDetector(onTap: () async {
                                          if (widget.regData.profileImage ==
                                              null) {
                                            widget.regData.profileImage =
                                                await getImage();
                                          } else {
                                            widget.regData.profileImage = null;
                                          }
                                          setState(() {});
                                        }))),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Full Name",
                            hintText: "Your Full Name",
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Email",
                            hintText: "Your Email",
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Password",
                            hintText: "Your Password",
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: retypePasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Confirm Password",
                            hintText: "Re-type Your Password",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 60,
                          margin: EdgeInsets.only(top: 40, bottom: 30),
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0)),
                              child: Text("Sign In",
                                  style: blackTextFont.copyWith(fontSize: 16)),
                              color: mainColor,
                              onPressed: () {
                                if (!(nameController.text.trim() != "" &&
                                    emailController.text.trim() != "" &&
                                    passwordController.text.trim() != "" &&
                                    retypePasswordController.text.trim() !=
                                        "")) {
                                  Flushbar(
                                    duration: Duration(seconds: 4),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Colors.redAccent,
                                    message: "Please fill all the field",
                                  )..show(context);
                                } else if (passwordController !=
                                    retypePasswordController) {
                                  Flushbar(
                                    duration: Duration(seconds: 4),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Colors.redAccent,
                                    message:
                                        "Mismatch password and confirm password",
                                  )..show(context);
                                } else if (passwordController.text.length < 6) {
                                  Flushbar(
                                    duration: Duration(seconds: 4),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Colors.redAccent,
                                    message:
                                        "Password's length min 6 character",
                                  )..show(context);
                                } else if (!EmailValidator.validate(
                                    emailController.text)) {
                                  Flushbar(
                                    duration: Duration(seconds: 4),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Colors.redAccent,
                                    message: "Worng formatted email address",
                                  )..show(context);
                                } else {
                                  widget.regData.name = nameController.text;
                                  widget.regData.email = emailController.text;
                                  widget.regData.password =
                                      passwordController.text;
                                }
                              }),
                        )
                      ],
                    )
                  ],
                ),
                color: whiteColor)));
  }
}
