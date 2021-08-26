import 'package:flutter/material.dart';
import 'package:ui_designs/src/widgets/custom_button.dart';
import 'package:ui_designs/src/widgets/custom_textfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Edit Profile"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            CustomTextField(
              labelText: "Full Name",
              placeholder: 'Divya Panthi',
              isPasswordTextField: false,
            ),
            CustomTextField(
              labelText: "Email",
              placeholder: "deevyapanthi03@gmail.com",
              isPasswordTextField: false,
                ),
            CustomTextField(
              labelText: "Phone",
              placeholder: "+977",
              isPasswordTextField: false,
            ),
            CustomTextField(
              labelText: "Address",
              placeholder: "Enter your Address",
              isPasswordTextField: false,
            ),

            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    buttonText: "Save",
                    onPrimaryColor: Colors.green,
                    width: 10,
                    onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                SizedBox(width:20,),
                Expanded(
                    child: CustomButton(
                      buttonText: "Cancel",
                      onPrimaryColor: Colors.black54,
                      width: double.infinity,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  )
              ],
            ),

          ],
        )

      ),

      );
  }


}
