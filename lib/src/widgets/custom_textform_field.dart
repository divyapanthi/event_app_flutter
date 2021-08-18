import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Function onTap;
  final Widget suffixIcon;
  final Function validator;
  final Function onSaved;
  final Function onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  const CustomTextFormField(
      {Key key,
      @required this.hintText,
      @required this.validator,
      this.onTap,
      this.suffixIcon,
      this.onSaved,
      this.onChanged,
      this.keyboardType,
      this.obscureText=false,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[200]))),
      child: TextFormField(
        onTap: onTap,
        onSaved: onSaved,
        obscureText: obscureText,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
