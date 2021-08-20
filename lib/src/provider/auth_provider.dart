import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier{

  //logic after we click google sign in
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount _user; //field for user that has signed in

  GoogleSignInAccount get user => _user; //getter method to get the google sign in account


  // this method executes everytime the user click the sign in with google button
  Future<void> googleLogin() async{
    try{
      // calling google sign in instance, pop up shows where we select user account
      final googleUser = await googleSignIn.signIn(); //
      print('-------------------$googleUser');

      //making sure if the user has selected an account
      if(googleUser == null) return;
      // saving user inside our field.
      _user = googleUser;

      // authenticating the fetched google user
      final googleAuth = await googleUser.authentication;
      print('-------------authentication--------------$googleAuth');
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential); // signing with credentials provided;

      notifyListeners(); // to update UI
    }

    catch(e){
      print(e.toString());
    }
  }

  Future<void> googleLogOut() async{
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();

  }


}