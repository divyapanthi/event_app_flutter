import 'package:flutter/material.dart';
import 'package:ui_designs/src/widgets/custom_submit_button.dart';
import 'package:ui_designs/src/widgets/custom_textfield.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Change Password"),
        leading: BackButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(height: 20,),
              CustomTextField(
                  placeholder: "Old Password",
                isPasswordTextField: true,
              ),
              CustomTextField(
                placeholder: "New Password",
                isPasswordTextField: true,
              ),
              CustomTextField(
                placeholder: "Confirm New Password",
                isPasswordTextField: true,
              ),
              SubmitButton(buttonText: "Save", width: double.infinity , onPressed: () => Navigator.of(context).pop(),btnStyle: ElevatedButton.styleFrom(
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
