import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_designs/src/screens/profile_screen.dart';
import '../screens/login.dart';


class AuthService{

  //Determine if the user is authenticated and redirect accordingly

  handleAuthState(){
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasData){
            return ProfileScreen();
          }
          else if (snapshot.hasError){
            return Center(child: Text("Something Went Wrong!"),);
          }else{
            return Login();
          }
        }
    );
  }

 }