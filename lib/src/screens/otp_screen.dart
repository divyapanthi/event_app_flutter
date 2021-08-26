import 'package:flutter/material.dart';
import 'package:ui_designs/src/core/constant/custom_header_decoration.dart';
import 'package:ui_designs/src/widgets/custom_button.dart';
import 'package:ui_designs/src/widgets/otp_form.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key key}) : super(key: key);

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
                    child: Text("OTP Verification", style: TextStyle(
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
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Text("Enter the 4 digits code you received on your email.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(height: 30,),
                            OTPForm(),
                            SizedBox(height: 30,),
                            CustomButton(buttonText: "Verify")
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