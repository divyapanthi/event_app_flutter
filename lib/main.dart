import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_designs/src/provider/auth_provider.dart';
import 'package:ui_designs/src/screens/home_screen.dart';
import 'package:ui_designs/src/screens/login.dart';
import 'package:ui_designs/src/screens/profile_screen.dart';
import 'package:ui_designs/src/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          home: HomeScreen(),
      ),
    );
  }
}
