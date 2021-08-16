import 'package:flutter/material.dart';
import 'package:ui_designs/src/screens/signup.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: SignUp(),
    );
  }
}
