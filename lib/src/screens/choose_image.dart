import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_designs/src/widgets/custom_button.dart';
import 'package:ui_designs/src/widgets/custom_list_tile.dart';

ImagePicker imagePicker = ImagePicker();

class ChoseImage extends StatefulWidget {
  const ChoseImage({Key key}) : super(key: key);

  @override
  _ChoseImageState createState() => _ChoseImageState();
}

class _ChoseImageState extends State<ChoseImage> {
  XFile _profileImage, _coverImage;
  bool _isToPickProfileImage = true;

  _imgFromCamera() async {
    XFile pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    _isToPickProfileImage
        ? setState(() => _profileImage = pickedImage)
        : setState(() => _coverImage = pickedImage);
  }

  _imgFromGalley() async {
    XFile pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    _isToPickProfileImage
        ? setState(() => _profileImage = pickedImage)
        : setState(() => _coverImage = pickedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              "Choose Profile Image",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            imagePlaceholder(isToPickProfileImage: true),
            SizedBox(
              height: 20,
            ),
            Text(
              "Choose Cover Image",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            imagePlaceholder(isToPickProfileImage: false),
            SizedBox(
              height: 4,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomButton(
                      buttonText: "Save",
                      onPressed: () {},
                      onPrimaryColor: Colors.deepOrange,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomButton(
                      buttonText: "Cancel",
                      onPressed: () => Navigator.of(context).pop(),
                      onPrimaryColor: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imagePlaceholder({@required bool isToPickProfileImage}) {
    final size = MediaQuery.of(context).size;

    return InkWell(
        onTap: () {
          setState(() => _isToPickProfileImage = isToPickProfileImage);
          _showPicker(context);
        },
        child:
            (isToPickProfileImage ? _profileImage != null : _coverImage != null)
                ? Image.file(
                    File(isToPickProfileImage
                        ? _profileImage.path
                        : _coverImage.path),
                    height: 230,
                    width: size.width / 0.2,
                  )
                : Container(
                    height: 230,
                    width: size.width / 0.2,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                      size: 100,
                    ),
                  ));
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
            child: Container(
          child: Wrap(
            children: <Widget>[
              CustomListTile(
                iconData: Icons.photo_library,
                title: "Gallery",
                onTap: () {
                  _imgFromGalley();
                  Navigator.of(context).pop();
                },
              ),
              CustomListTile(
                iconData: Icons.photo_camera,
                title: "Camera",
                onTap: () {
                  _imgFromCamera();
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ));
      },
    );
  }

/*  Widget buildProfileImage() {
    final size = MediaQuery.of(context).size;
    return InkWell(
        onTap: (){
          _showPicker(context, (ImageSource source){
            chooseProfileImage(context,source);
          });
        },
        child:
        _image != null ?
        Image.file(File(_image.path), height: 230, width: size.width/0.2,):
        Container(
          height:230,
          width: size.width/0.2,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Icon(
            Icons.camera_alt,
            color: Colors.grey,
            size: 100,
          ),
        )
    );
  }

  Widget buildCoverImage() {
    final size = MediaQuery.of(context).size;
    return InkWell(
        onTap: (){
          _showPicker(context, (ImageSource source){
            chooseCoverImage(context,source);
          });
        },
        child:
        _image != null ?
        Image.file(File(_image.path), height: 230, width: size.width/0.2,):
        Container(
          height:230,
          width: size.width/0.2,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Icon(
            Icons.camera_alt,
            color: Colors.grey,
            size: 100,
          ),
        )
    );
  }*/
}
