import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_designs/src/core/constant/custom_form_decoration.dart';
import 'package:ui_designs/src/core/constant/custom_header_decoration.dart';
import 'package:ui_designs/src/screens/login.dart';
import 'package:ui_designs/src/widgets/custom_submit_button.dart';
import 'package:ui_designs/src/widgets/custom_textform_field.dart';
import '../core/validators/global_validator.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();

}

class _SignUpState extends State<SignUp> with GlobalValidator {
  final formkey = GlobalKey<FormState>();
  String name;
  String email;
  String password1;
  String password2;

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
              height: 45,
            ),
            Padding(
                padding: EdgeInsets.all(30),
                child: customHeaderTextWidget(
                    "Sign Up", "Create an Account, its free")),
            SizedBox(height: 2),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Container(
                    decoration: customDesignRadius(),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: customFormDecoration(),
                            child: Column(children: <Widget>[
                              CustomTextFormField(
                                hintText: "Full Name",
                                onChanged: (String val) {},
                                validator: GlobalValidator.validateFullName,
                                onSaved: (String val)=>name=val,
                              ),
                              CustomTextFormField(
                                hintText: "Email",
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (String val) {},
                                validator: GlobalValidator.validateEmail,
                                //onSaved: (String val){email=val;},
                              ),
                              CustomTextFormField(
                                hintText: "Password",
                                onChanged: (String val) {},
                                validator: GlobalValidator.validatePassword,
                                //onSaved: (String val){password1= val;},
                              ),
                              CustomTextFormField(
                                hintText: "Confirm Password",
                                onChanged: (String val){},
                                validator: GlobalValidator.validateConfirmPassword,
                                onSaved:(String val){password2=val;},),
                              // buildGenderField(),

                            ]),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          SubmitButton(
                            buttonText: "Submit",
                            onPressed: () {
                              if (!formkey.currentState.validate()) return;
                              formkey.currentState.save();
                            },
                          ),
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
                      )
                  ),
                ),
            ),
              ))
          ],
        ),
      ),
    );
  }
}

