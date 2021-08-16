import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:ui_designs/src/core/constant/custom_box_decoration.dart';
import 'package:ui_designs/src/widgets/custom_text_field.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: customBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                )),
            SizedBox(height: 10),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                )
                              ]),
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                CustomTextField(hintText: "Email or Phone Number"),
                                CustomTextField(hintText: "Password"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        Container(
                          height: 50,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange[900],
                              onPrimary: Colors.white,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 16),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 10),

                          // child: SignInButton(
                          //   Buttons.Google,
                          //   // mini: true,
                          //   onPressed: () async =>
                          //       await launch("https://accounts.google.com/"),
                          // ),
                        ),

                        SizedBox(height: 8),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: SignInButton(
                            Buttons.Facebook,
                            // mini: true,
                            onPressed: () async =>
                                await launch("https://www.facebook.com"),
                          ),
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
