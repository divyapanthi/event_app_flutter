import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Function onTap;
  final Widget suffix;


  const CustomTextField({Key key, @required this.hintText, this.onTap, this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[200]))),
      child: TextField(
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: suffix,
        ),
      ),
    );
  }
}
