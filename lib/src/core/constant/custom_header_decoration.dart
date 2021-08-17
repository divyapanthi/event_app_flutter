import 'package:flutter/material.dart';

customHeaderDecoration() {
  return BoxDecoration(
    gradient: LinearGradient(begin: Alignment.topCenter, colors: [
    Colors.orange[900],
    Colors.orange[700],
    Colors.orange[400],
  ]));
}

customHeaderTextWidget(text1, text2){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "$text1",
        style: TextStyle(color: Colors.white, fontSize: 40),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "$text2",
        style: TextStyle(color: Colors.white, fontSize: 18),
      )
    ],
  );
}

customDesignRadius(){
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(60),
        topRight: Radius.circular(60),
      ));
}
