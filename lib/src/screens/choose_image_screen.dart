import 'package:flutter/material.dart';

class ChooseImageScreen extends StatefulWidget {
  const ChooseImageScreen({Key key}) : super(key: key);

  @override
  _ChooseImageScreenState createState() => _ChooseImageScreenState();
}

class _ChooseImageScreenState extends State<ChooseImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Text("Choose Cover Pic"),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage("https://www.pngitem.com/pimgs/m/33-336751_facebook-camera-icon-png-transparent-png.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.camera_alt_outlined,
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
