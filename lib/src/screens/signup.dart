import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_designs/src/core/constant/custom_form_decoration.dart';
import 'package:ui_designs/src/core/constant/custom_header_decoration.dart';
import 'package:ui_designs/src/screens/login.dart';
import 'package:ui_designs/src/widgets/custom_submit_button.dart';
import 'package:ui_designs/src/widgets/custom_text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key key}) : super(key: key);

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
            Padding(padding: EdgeInsets.all(10), child: customHeaderTextWidget("Sign Up", "Create and Account, its free")),
            SizedBox(height: 10),
            Expanded(
              child: Container(
              decoration: customDesignRadius(),
              child: Padding(
                padding: EdgeInsets.all(25),
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
                          CustomTextField(hintText: "Password"),
                          CustomTextField(hintText: "Confirm Password"),
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: DropdownButtonFormField(
                                onChanged: (val) {},
                                items: [
                                  DropdownMenuItem(
                                    child: Text("Male"),
                                    value: "Male",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Female"),
                                    value: "Female",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Other"),
                                    value: "Other",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Rather Not Say"),
                                    value: "Rather Not Say",
                                  ),
                                ],
                                style: TextStyle(color: Colors.grey),
                                decoration: InputDecoration(
                                  hintText: "Select Gender",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  focusColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SubmitButton(buttonText: "Login"),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return Login();
                            }));
                          },
                          child: Text("Login",
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
