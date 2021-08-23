import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_designs/src/provider/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser; //user that is currently signed in
    return Scaffold(
      appBar: AppBar(
        title: Text("Logged In"),
        centerTitle: true,
        actions: [
          TextButton(
              child: Text("Log Out", style: TextStyle(color: Colors.white),),
              onPressed: (){
                final provider = Provider.of<AuthProvider>(context, listen: false);
                  provider.facebookLogout();
                  provider.googleLogout();

                },
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        // decoration: customHeaderDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Column(
              children: [
                SizedBox(height: 60,),
                Container(
                  child: Column(
                    children: [
                      Text("Profile", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.orange[900]),),
                      SizedBox(height: 22,),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(user.photoURL),
                      ),
                      SizedBox(height: 22,),
                      Text(
                        'Name: ' + user.displayName,
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                      ),
                      Text(
                        'Email: ' + user.email,
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      )
                    ],
                  ),
                )
              ],
            )
            // customHeaderDecoration(),
          ],
        ),
      ),
    );
  }
}
