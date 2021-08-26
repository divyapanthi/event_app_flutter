import 'package:flutter/material.dart';
import 'package:ui_designs/src/core/constant/custom_form_decoration.dart';
import 'package:ui_designs/src/core/constant/custom_header_decoration.dart';
import 'package:ui_designs/src/screens/otp_screen.dart';
import 'package:ui_designs/src/widgets/custom_button.dart';
import 'package:ui_designs/src/widgets/custom_textform_field.dart';
import '../core/validators/global_validator.dart';


class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          width: double.infinity,
          decoration: customHeaderDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              SizedBox(height: 120,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Forgot Password", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 26,
                ),
                )
              ),
              Expanded(
                  child: Container(
                    decoration: customDesignRadius(),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Text("Please enter your email and we will send you a 4 digits code to your email.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 30,),
                          Container(
                            decoration: customFormDecoration(),
                            child: Column(
                              children: <Widget> [
                                CustomTextFormField(
                                  hintText: "Enter your email",
                                  suffixIcon: Icon(Icons.email_rounded,
                                    color: Colors.orange[900],),
                                  validator: GlobalValidator.validateEmail,)
                              ],
                            ),
                          ),
                          SizedBox(height: 30,),
                          CustomButton(buttonText: "Continue", onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                            return OTPScreen();
                            }));
                          },),
                        ],
                      ),
                    ),
                  )
              )
            ]
          )
        ),
    );
  }
}