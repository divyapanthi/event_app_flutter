import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_designs/src/core/constant/custom_form_decoration.dart';
import 'package:ui_designs/src/core/constant/custom_header_decoration.dart';
import 'package:ui_designs/src/screens/forgot_password.dart';
import 'package:ui_designs/src/screens/signup.dart';
import 'package:ui_designs/src/widgets/custom_submit_button.dart';
import 'package:ui_designs/src/widgets/custom_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: customHeaderDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(padding: EdgeInsets.all(20), child: customHeaderTextWidget("Login", "Welcome Back")),
            SizedBox(height: 10),
            Expanded(
                child: Container(
                  decoration: customDesignRadius(),
                  child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: customFormDecoration(),
                          child: Column(
                            children: <Widget>[
                              CustomTextField(hintText: "Email or Phone Number"),
                              CustomTextField(hintText: "Password",obscureText: true,),
                            ],
                          ),
                        ),
                        SizedBox(height: 25,),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return ForgotPassword();
                            }));
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.grey, decoration: TextDecoration.underline),

                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        SubmitButton(buttonText: "Login"),

                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              // margin: EdgeInsets.symmetric(horizontal: 10),
                              child: IconButton(
                                icon: SvgPicture.asset("assets/images/google.svg"),
                                  onPressed: () async =>
                                      await launch("https://accounts.google.com/"),
                                ),
                                // child: SignInButton(
                                //   Buttons.Google,
                                //   // mini: true,
                                //   onPressed: () async =>
                                //       await launch("https://accounts.google.com/"),
                                // ),
                              ),
                              SizedBox(width: 2),
                              Container(
                                height: 50,
                                // margin: EdgeInsets.symmetric(horizontal: 20),
                                child: IconButton(
                                  icon: SvgPicture.asset("assets/images/facebook.svg"),
                                  onPressed: () async =>
                                  await launch("https://www.facebook.com"),
                                ),
                                // child: SignInButton(
                                //   Buttons.Facebook,
                                //   // mini: true,
                                //   onPressed: () async =>
                                //       await launch("https://www.facebook.com"),
                                // ),
                              )
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (ctx) {
                                  return SignUp();
                                }));
                              },
                              child: Text("Create One",
                                  style: TextStyle(
                                      color: Colors.orange[900],
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
