import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String placeholder;
  final bool isPasswordTextField;

  const CustomTextField(
  {Key key,
  this.labelText, this.placeholder,
  this.isPasswordTextField,

  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom:40),
        child: TextField(
          obscureText: widget.isPasswordTextField ? isObscurePassword : false,
          decoration: InputDecoration(
            suffixIcon: widget.isPasswordTextField ?
                IconButton(
                    icon: Icon(Icons.remove_red_eye, color: Colors.deepOrange,),
                    onPressed:() {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    }): null,
              // contentPadding: EdgeInsets.only(bottom: 2),
              labelText: widget.labelText,
              labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: widget.placeholder,
              hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              )
          ),
        )
    );
  }
}
