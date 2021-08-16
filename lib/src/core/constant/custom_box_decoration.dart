import 'package:flutter/material.dart';

customBoxDecoration() {
  return BoxDecoration(
      gradient: LinearGradient(begin: Alignment.topCenter, colors: [
    Colors.orange[900],
    Colors.orange[700],
    Colors.orange[400],
  ]));
}
