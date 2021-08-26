import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_designs/src/provider/auth_provider.dart';
import 'package:ui_designs/src/screens/change_password.dart';
import 'package:ui_designs/src/screens/choose_image_screen.dart';
import 'package:ui_designs/src/screens/edit_profile.dart';
import 'package:ui_designs/src/widgets/custom_list_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              onPressed: () =>
                  Provider.of<AuthProvider>(context, listen: false).logout(),
              //     {
              //   Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              //     return EditProfile();
              //   }));
              // }
            )
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: Consumer<AuthProvider>(builder: (context, data, _) {
          return data.currentUser == null
              ? data.logout()
              : data.isWaiting
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: [
                                Container(
                                  child: Column(children: [
                                    buildUserDetail(data),
                                    SizedBox(
                                      height: 80,
                                    ),
                                    Divider(),
                                    CustomListTile(
                                      title: data.currentUser.displayName,
                                      iconData: Icons.person,
                                      onTap: () {},
                                    ),
                                    Divider(),
                                    CustomListTile(
                                      title: data.currentUser.email,
                                      iconData: Icons.email,
                                      onTap: () {},
                                    ),
                                    Divider(),
                                    CustomListTile(
                                      title: "9857036932",
                                      iconData: Icons.phone,
                                      onTap: () {},
                                    ),
                                    Divider(),
                                    CustomListTile(
                                      title: "Kathmandu,Nepal",
                                      iconData: Icons.pin_drop,
                                      onTap: () {},
                                    ),
                                    Divider(),
                                    CustomListTile(
                                        title: "Change Password",
                                        iconData: Icons.visibility,
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return ChangePassword();
                                          }));
                                        }),
                                    Divider(),
                                    CustomListTile(
                                      title: "Logout",
                                      iconData: Icons.logout,
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (ctx) {
                                          return EditProfile();
                                        }));
                                      },
                                      // onTap: () => Provider.of<AuthProvider>(
                                      //         context,
                                      //         listen: false)
                                      //     .logout()),
                                    )
                                  ]),
                                )
                              ],
                            )
                            // customHeaderDecoration(),
                          ],
                        ),
                      ),
                    );
        }));
  }

  Widget buildUserDetail(AuthProvider data) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        buildCoverImage(context, data),
        Positioned(
          top: MediaQuery.of(context).size.height / 10,
          left: 0,
          right: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
              ),
              buildProfilePicture(context, data),
              Text(
                data.currentUser.displayName,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildCoverImage(BuildContext context, AuthProvider data) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
        child: Image.network(
          "https://img.huffingtonpost.com/asset/5df949c6240000e70c5a39da.jpeg?cache=k8iXwHWWIe&ops=1778_1000",
          height: size.height / 4,
          width: size.width,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  buildProfilePicture(BuildContext context, AuthProvider data) {
    return data == null
        ? Center(
            child: Text('Something Went Wrong !!!'),
          )
        : Stack(
            children: [
              if (data?.currentUser?.photoURL != null)
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
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.deepOrange,
                      size: 17,
                    ),
                    padding: EdgeInsets.all(8.0),
                    shape: CircleBorder(),
                  )),
            ],
          );
  }
}
