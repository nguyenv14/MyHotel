import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_hotel/configs/extensions.dart';
import 'package:my_hotel/configs/routes/routes_name.dart';
import 'package:my_hotel/view/login/components/InputFieldComponet.dart';
import 'package:my_hotel/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textControllerMail = new TextEditingController();
  TextEditingController textControllerPass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.grey[100],
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Consumer<LoginViewModel>(
              builder: (context, loginViewModel, child) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome!",
                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w800),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
                        child: Text(
                          "Unlock a world of flavors with your culinary passport.",
                          style: GoogleFonts.openSans(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      InputFieldComponent(
                        hintText: "Enter your email",
                        iconData: FontAwesomeIcons.userTie,
                        textEditingController: textControllerMail,
                        color: Colors.pinkAccent[100]!,
                        // isPassword: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // InputPasswordComponent()
                      InputFieldComponent(
                        hintText: "Enter your password",
                        iconData: FontAwesomeIcons.lock,
                        textEditingController: textControllerPass,
                        color: Colors.pinkAccent[100]!,
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            child: Text(
                              "Forgott Password?",
                              style: GoogleFonts.openSans(
                                  color: Colors.pinkAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      loginViewModel.loginLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.pinkAccent,
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                loginViewModel
                                    .loginApi(textControllerMail.text,
                                        textControllerPass.text)
                                    .then((value) {
                                  // print(value.message);
                                  if (value.statusCode == 200) {
                                    CherryToast.success(
                                      title: Text("Đăng nhập thành công!"),
                                    ).show(context);
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        RoutesName.home, (route) => false);
                                  } else {
                                    CherryToast.error(
                                            title: Text(
                                                "Sai mật khẩu hoặc email!"))
                                        .show(context);
                                  }
                                });
                              },
                              child: Center(
                                child: Container(
                                  width: context.mediaQueryWidth * 0.8,
                                  decoration: BoxDecoration(
                                      color: Colors.pinkAccent,
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 14),
                                  child: Center(
                                      child: Text(
                                    "Sign in",
                                    style: GoogleFonts.openSans(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 20,
                      ),

                      Center(
                        child: Text(
                          "Or Continue with",
                          style:
                              GoogleFonts.openSans(fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      InkWell(
                        onTap: () {
                          print("haha");
                        },
                        child: Center(
                          child: Container(
                            width: context.mediaQueryWidth * 0.8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(1, 1),
                                      blurRadius: 10)
                                ],
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 14),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage("assets/images/search.png"),
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Signin with Google",
                                  style: GoogleFonts.openSans(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.mediaQueryHeight * 0.2,
                      ),

                      InkWell(
                        onTap: () {
                          print("haha");
                        },
                        child: Center(
                            child: RichText(
                                text: TextSpan(
                                    text: "Don't have an account? ",
                                    style: GoogleFonts.openSans(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    children: [
                              TextSpan(
                                  text: "Sign up",
                                  style: GoogleFonts.openSans(
                                      color: Colors.pinkAccent,
                                      fontWeight: FontWeight.bold))
                            ]))),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
