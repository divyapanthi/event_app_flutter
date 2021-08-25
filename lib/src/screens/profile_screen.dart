import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_designs/src/provider/auth_provider.dart';
import 'package:ui_designs/src/screens/change_password.dart';
import 'package:ui_designs/src/screens/choose_image_screen.dart';
import 'package:ui_designs/src/screens/login.dart';
import 'package:ui_designs/src/screens/edit_profile.dart';
import 'package:ui_designs/src/widgets/custom_submit_button.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final user = FirebaseAuth.instance.currentUser; //user that is currently signed in
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Profile"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.edit_sharp,
                color: Colors.white,
              ),
              onPressed: ()
                  // => Provider.of<AuthProvider>(context, listen: false).logout(),
              {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) {
                  return EditProfile();
                })
                );
              }
              )
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Consumer<AuthProvider>(
        builder: (context, data, _) {
          return data.busy ? Center(child: CircularProgressIndicator()) :  Container(
            width: double.infinity,

            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            buildUserDetail(data),
                            SizedBox(height: 80,),
                            Divider(),
                            buildNameSection(context,data),
                            Divider(),
                            buildEmailSection(context, data),
                            Divider(),
                            buildPhoneSection(context, data),
                            Divider(),
                            buildAddressSection(context, data),
                            Divider(),
                            buildChange(),
                            Divider(),
                            buildLogoutSection(context, data),

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
        },
      ),
    );
  }


 Widget buildUserDetail(AuthProvider data) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        buildCoverImage(context, data),
        Positioned(
          top: MediaQuery.of(context).size.height/10,
          left: 0,
          right: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 50,),
              buildProfilePicture(context, data),
              Text(data.currentUser.displayName, style:
                Theme.of(context).textTheme.headline6,),
            ],
          ),
        ),

      ],

    );
 }

  buildCoverImage(BuildContext context, AuthProvider data) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){},
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
            ),
        child: Image.network(
            "https://img.huffingtonpost.com/asset/5df949c6240000e70c5a39da.jpeg?cache=k8iXwHWWIe&ops=1778_1000",
            height: size.height/4,
          width: size.width,
          fit: BoxFit.fill,
        ),


      ),
    );
  }

  buildProfilePicture(BuildContext context, AuthProvider data) {
    final size = MediaQuery.of(context).size;
      return Stack(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(data.currentUser.photoURL),
            ),
          ),
          Positioned(
              top: -5,
              right: -25,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) {
                    return ChooseImageScreen();
                  }));
                },
                fillColor: Colors.white,
                child: Icon(Icons.camera_alt_outlined, color: Colors.deepOrange,
                  size: 17,),
                padding: EdgeInsets.all(8.0),
                shape: CircleBorder(),
              )),
        ],
      );
    }

  buildNameSection(BuildContext context, AuthProvider data) {
    return ListTile(
      title: Text(data.currentUser.displayName, style: Theme.of(context).textTheme.subtitle1,),
      leading: Icon(Icons.person),
      onTap: () {
        });
   }

  buildEmailSection(BuildContext context, AuthProvider data) {
    return ListTile(
        title: Text(data.currentUser.email, style: Theme.of(context).textTheme.subtitle1,),
        leading: Icon(Icons.email),
        onTap: () {
        });
  }

  buildPhoneSection(BuildContext context, AuthProvider data) {
    return ListTile(
        title: Text('9857036932', style: Theme.of(context).textTheme.subtitle1,),
        leading: Icon(Icons.phone),
        onTap: () {
        });
  }

  buildAddressSection(BuildContext context, AuthProvider data) {
    return ListTile(
        title: Text('Kathmandu, Nepal', style: Theme.of(context).textTheme.subtitle1,),
        leading: Icon(Icons.pin_drop),
        onTap: () {
        });
  }

  buildChange() {
    return ListTile(
        title: Text('Change Password', style: Theme.of(context).textTheme.subtitle1,),
        leading: Icon(Icons.remove_red_eye),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context){
                return ChangePassword();
          }));
        });
  }

  buildLogoutSection(BuildContext context, AuthProvider data) {
    return ListTile(
        title: Text("Logout", style: Theme.of(context).textTheme.subtitle1,),
        leading: Icon(Icons.logout),
        onTap: () => Provider.of<AuthProvider>(context, listen: false).logout()

    );
  }


    Widget buildChangePassword() {
      return Container(
        height: 40,
        width: double.infinity,
        child: TextButton(
          onPressed: () {},
          child: Text("Change Password", style: TextStyle(fontSize: 16, color: Colors.grey,),),
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(5),
            primary: Colors.green,
          ),
        ),
      );
    }
}


