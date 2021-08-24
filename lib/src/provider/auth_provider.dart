import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ui_designs/src/screens/login.dart';


class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Stream<User> authStateChanges() => _auth.authStateChanges();

  User _currentUser;

  User get currentUser => _currentUser;

  final _googleSignIn = GoogleSignIn();
  final _facebookLogin = FacebookLogin();

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool val){
    _busy = val;
    notifyListeners();
  }

  GoogleSignInAccount _googleUser; //field for user that has signed in
  GoogleSignInAccount get googleUser =>
      _googleUser; //getter method to get the google sign in account

  // this method executes everytime the user click the sign in with google button
  Future<void> googleLogin() async {
    try {
      // calling google sign in instance, pop up shows where we select user account
      final googleUser = await _googleSignIn.signIn(); //

      //making sure if the user has selected an account
      if (googleUser == null) return;
      // saving user inside our field.
      _googleUser = googleUser;

      // authenticating the fetched google user
      setBusy(true);
      final googleAuth = await googleUser.authentication;

      //Create a new credential for signing in with google
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in
      await _auth.signInWithCredential(credential);
      _currentUser = _auth.currentUser;
      setBusy(false);


      // to update UI
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signUpWithFacebook() async {
    try {
      setBusy(true);
      final response = await _facebookLogin.logIn(permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ]);

      //Check result status
      switch (response.status) {
        case FacebookLoginStatus.success:
          // The user is successfully logged in

          // Send access token to server for validation and auth
          final fbToken = response.accessToken;
          final userCredential = await _auth.signInWithCredential(
            FacebookAuthProvider.credential(fbToken.token),
          );

          _currentUser = _auth.currentUser;
          setBusy(false);
          return userCredential.user;

        case FacebookLoginStatus.cancel:
          // In case the user cancels the login process
          throw FirebaseAuthException(
            code: 'ERROR_ABORTED_BY_USER',
            message: "Sign in aborted by user",
          );

        case FacebookLoginStatus.error:
          throw FirebaseAuthException(
            code: 'ERROR_FACEBOOK_LOGIN_FAILED',
            message: response.error.developerMessage,
          );
        default:
          throw UnimplementedError();
      }
    } catch (error) {
      print(error.toString());
    }
    notifyListeners();
  }


  Future<User> signUpWithEmailandPassword(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
     email: email,
      password: password,
    );
    return userCredential.user;
  }


  Future<void> logout() async {
    await Future.wait(
        [_googleSignIn.signOut(), _facebookLogin.logOut(), _auth.signOut()]);
    _currentUser = null;
    notifyListeners();
  }

}
