import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String buttonText;

  const SubmitButton({Key key, @required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "$buttonText",
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
    );
  }
}