import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {

  final String  title;
  final IconData iconData;
  final Function onTap;

  const CustomListTile({Key key, @required this.title, this.iconData, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title, style: TextStyle(color: Colors.black54),),
        leading: Icon(iconData),
        onTap: onTap,
    );
  }
}
