import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  final double width;
  final ButtonStyle btnStyle;

  final Color onPrimaryColor;



  const CustomButton({Key key, @required this.buttonText, this.onPressed, this.width, this.btnStyle, this.onPrimaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          "$buttonText",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,),
        ),
        style: ElevatedButton.styleFrom(
          primary: onPrimaryColor?? Colors.deepOrange,
          onPrimary: Colors.white,
          padding: EdgeInsets.all(14),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
