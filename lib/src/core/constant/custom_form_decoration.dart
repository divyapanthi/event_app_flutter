import 'package:flutter/material.dart';

customFormDecoration(){
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(225, 95, 27, .3),
          blurRadius: 2,
          offset: Offset(0, 2),
        )
      ]);
}

