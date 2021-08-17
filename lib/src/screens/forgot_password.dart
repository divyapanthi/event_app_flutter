import 'package:flutter/material.dart';
import 'package:ui_designs/src/core/constant/custom_form_decoration.dart';
import 'package:ui_designs/src/widgets/custom_submit_button.dart';
import 'package:ui_designs/src/widgets/custom_text_field.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 330,
        width: double.infinity,
        // decoration: customHeaderDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Forgot Password", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange[900],
                fontSize: 24,
              ),
              )
            ),
            Expanded(
                child: Container(
                  // decoration: customDesignRadius(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        // SizedBox(height: 2,),
                        Text("Please enter an email and we will send you a link to get back to your account.",
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
                              CustomTextField(hintText: "Enter your email", suffix: Icon(Icons.email_rounded),)
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        SubmitButton(buttonText: "Continue"),
                      ],
                    ),
                  ),
                )
            )
          ]
        )
      );
  }
}