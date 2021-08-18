import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        // decoration: customHeaderDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Column(
              children: [
                SizedBox(height: 80,),
                Text("Profile", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.orange[900]),),
                SizedBox(
                  height: 70,
                  width: 80,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircleAvatar(
                        foregroundImage: NetworkImage("https://www.pngitem.com/pimgs/m/146-1468843_profile-icon-orange-png-transparent-png.png"),
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
