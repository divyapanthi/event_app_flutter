import 'package:flutter/material.dart';

final otpInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder(){
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.grey[500])
  );
}

