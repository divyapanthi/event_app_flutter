import 'package:flutter/material.dart';
import 'package:ui_designs/src/widgets/custom_button.dart';
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
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              ClipRect(child: Image.network("https://i.pcmag.com/imagery/articles/06r3O9TGIbCXQhR7C69f1vE-10..1617039239.jpg")),
              SizedBox(
                height: 50,
              ),
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
              buildButtons(context),
            ],
          )),
    );
  }

  Widget buildButtons(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CustomButton(
              buttonText: "Save",
              onPrimaryColor: Colors.green,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          SizedBox(width:20,),
          Expanded(
            child: CustomButton(
              buttonText: "Cancel",
              onPrimaryColor: Colors.black54,
              onPressed: () => Navigator.of(context).pop(),
            ),
          )
        ],
      ),
    );
  }
}
