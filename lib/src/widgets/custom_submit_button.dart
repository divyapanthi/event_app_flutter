import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  final double width;
  final ButtonStyle btnStyle;



  const SubmitButton({Key key, @required this.buttonText, this.onPressed, this.width, this.btnStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 70),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          "$buttonText",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        style: btnStyle,
      ),
    );
  }
}
