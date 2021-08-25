import 'package:flutter/material.dart';

CustomButtonStyle(){
  return ElevatedButton.styleFrom(
    primary: Colors.orange[900],
    onPrimary: Colors.white,
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(20.0),
    ),
  );
  }