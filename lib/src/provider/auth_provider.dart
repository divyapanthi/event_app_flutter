import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthProvider extends ChangeNotifier{

  //logic after we click google sign in
  final _googleSignIn = GoogleSignIn();
  final _facebookLogin = FacebookLogin();


  final FirebaseAuth _auth = FirebaseAuth.instance;

  Map facebookUserData;



  GoogleSignInAccount _googleUser; //field for user that has signed in
  GoogleSignInAccount get googleUser => _googleUser; //getter method to get the google sign in account


  // this method executes everytime the user click the sign in with google button
  Future<void> googleLogin() async{
    try{
      // calling google sign in instance, pop up shows where we select user account
      final googleUser = await _googleSignIn.signIn(); //
      print('-------------------$googleUser');

      //making sure if the user has selected an account
      if(googleUser == null) return;
      // saving user inside our field.
      _googleUser = googleUser;

      // authenticating the fetched google user
      final googleAuth = await googleUser.authentication;
      print('-------------authentication--------------$googleAuth');

      //Create a new credential for signing in with google
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in
      await FirebaseAuth.instance.signInWithCredential(credential);

      notifyListeners(); // to update UI
    }

    catch(e){
      print(e.toString());
    }
  }


  Future<UserCredential> signUpWithFacebook() async{


    try{
      var res = await _facebookLogin.logIn(
          permissions:[
            FacebookPermission.publicProfile,
            FacebookPermission.email,
          ] );

      //Check result status
      switch(res.status){
        case FacebookLoginStatus.success:
        // The user is successfully logged in

        // Send access token to server for validation and auth
          final FacebookAccessToken fbToken = res.accessToken;
          final AuthCredential authCredential = FacebookAuthProvider.credential(fbToken.token);

          print("here is your token, $fbToken");

          final result = await FirebaseAuth.instance.signInWithCredential(authCredential);

          // Get profile data from facebook for use in the app
          final profile = await _facebookLogin.getUserEmail();
          // print('Hello, ${profile.name} Your ID: ${profile.userId}');

          // Get user profile image url
          final imageUrl = await _facebookLogin.getProfileImageUrl(width: 100);
          print("Your profile image: $imageUrl");

          // fetch user email
          final email = await _facebookLogin.getUserEmail();
          //But user can decline permission
          if(email != null) print('Your email is $email');

          if(fbToken.token != null){

          }

          break;
        case FacebookLoginStatus.cancel:
        // In case the user cancels the login process
          print("The user cancelled");
          break;
        case FacebookLoginStatus.error:
        // Login procedure failed
          print('Error while log in: ${res.error}');
          break;
      }

    }catch(error){
      print (error.toString());
    }
  }
  Future<void> googleLogout() async{
    await _googleSignIn.disconnect();
    await _auth.signOut();
  }

  Future<void> facebookLogout() async{
    await _facebookLogin.logOut();

    await _auth.signOut();

  }




}
