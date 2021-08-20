import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_designs/src/core/constant/custom_form_decoration.dart';
import 'package:ui_designs/src/core/constant/custom_header_decoration.dart';
import 'package:ui_designs/src/provider/auth_provider.dart';
import 'package:ui_designs/src/screens/forgot_password.dart';
import 'package:ui_designs/src/screens/home_screen.dart';
import 'package:ui_designs/src/screens/profile_screen.dart';
import 'package:ui_designs/src/screens/signup.dart';
import 'package:ui_designs/src/widgets/custom_submit_button.dart';
import 'package:ui_designs/src/widgets/custom_textform_field.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/validators/global_validator.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formkey = GlobalKey<FormState>();
  String name;
  String email;
  String password;

  bool obscureText = true;

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
            SizedBox(
              height: 80,
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: customHeaderTextWidget("Login", "Welcome Back")),
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
                    Form(
                      key: formkey,
                      child: Container(
                        decoration: customFormDecoration(),
                        child: Column(
                          children: <Widget>[
                            CustomTextFormField(
                              hintText: "Email or Phone Number",
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (String val) {},
                              validator: GlobalValidator.validateEmail,
                              onSaved: (String val) {
                                email = val;
                              },
                            ),
                            CustomTextFormField(
                              hintText: "Password",
                              obscureText: obscureText,
                              suffixIcon: IconButton(
                                icon: Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                              ),
                              onChanged: (String val) {},
                              validator: GlobalValidator.validatePassword,
                              onSaved: (String val) {
                                password = val;
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return ForgotPassword();
                        }));
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SubmitButton(
                      buttonText: "Login",
                      onPressed: () {
                        formkey.currentState.validate();
                      },
                    ),
                    SizedBox(height: 16),
                    Text("Or login with", style: TextStyle(color: Colors.grey),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          // margin: EdgeInsets.symmetric(horizontal: 10),
                          child: IconButton(
                              icon:
                                  SvgPicture.asset("assets/images/google.svg"),
                              onPressed: () async =>
                                  await Provider.of<AuthProvider>(context,
                                          listen: false)
                                      .googleLogin()),
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
                            icon:
                                SvgPicture.asset("assets/images/facebook.svg"),
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
                    SizedBox(
                      height: 8,
                    ),
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
