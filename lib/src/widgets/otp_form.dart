import 'package:flutter/material.dart';
import 'package:ui_designs/src/core/constant/otp_input_decoration.dart';
import 'package:ui_designs/src/widgets/custom_submit_button.dart';

class OTPForm extends StatefulWidget {
  const OTPForm({Key key}) : super(key: key);

  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width:  MediaQuery.of(context).size.width*0.14,
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 24,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
              ),
            ),
            SizedBox(
              width:  MediaQuery.of(context).size.width*0.14,
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
              ),
            ),
            SizedBox(
              width:  MediaQuery.of(context).size.width*0.14,
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
              ),
            ),
            SizedBox(
              width:  MediaQuery.of(context).size.width*0.14,
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

