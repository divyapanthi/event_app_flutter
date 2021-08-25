import 'package:flutter/material.dart';
import 'package:ui_designs/src/widgets/custom_submit_button.dart';
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

            SubmitButton(buttonText: "Save", width: double.infinity , onPressed: () => Navigator.of(context).pop(),
              btnStyle: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                )
            )
              ,),
            SizedBox(height: 14,),
            SubmitButton(buttonText: "Cancel", width: double.infinity, onPressed: () => Navigator.of(context).pop(),
              btnStyle: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  )
              ),
            )

          ],
        )

      ),

      );
  }


}
