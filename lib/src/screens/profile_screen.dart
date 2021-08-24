import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_designs/src/provider/auth_provider.dart';
import 'package:ui_designs/src/utils/image_helper.dart';

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
          TextButton(
              child: Text(
                "Edit",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () =>
                  Provider.of<AuthProvider>(context, listen: false).logout())
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Consumer<AuthProvider>(
        builder: (context, data, _) {
          return data.busy ? Center(child: CircularProgressIndicator()) :  Container(
            width: double.infinity,

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
                          buildLogoutSection(context, data),

                          /*   Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange[900]),
                          ),*/

                        ],
                      ),
                    )
                  ],
                )
                // customHeaderDecoration(),
              ],
            ),
          );
        },
      ),
    );
  }


 Stack buildUserDetail(AuthProvider data) {
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
        )
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
    if (data.currentUser.photoURL != null)
      return InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle),
            child: CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(data.currentUser.photoURL),
          ),

            /*color: Colors.orange,
            width: size.width / 4,
            height: size.height / 4.5,*/

            /*decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white,
              width: 5,),
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(
                  data.currentUser.photoURL!= null ? data.currentUser.photoURL : getImage("https://assets.rappler.com/612F469A6EA84F6BAE882D2B94A4B421/img/4D2FE4280B7241769C3453EACEB5DC22/eiffel-tower-shutterstock-june-10-2020_4D2FE4280B7241769C3453EACEB5DC22.jpg")
                )
              )
            ),*/
          ),
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
        title: Text('Add Phone', style: Theme.of(context).textTheme.subtitle1,),
        leading: Icon(Icons.phone),
        onTap: () {
        });
  }

  buildAddressSection(BuildContext context, AuthProvider data) {
    return ListTile(
        title: Text('Add Address', style: Theme.of(context).textTheme.subtitle1,),
        leading: Icon(Icons.pin_drop),
        onTap: () {
        });
  }

  buildLogoutSection(BuildContext context, AuthProvider data) {
    return ListTile(
        title: Text("Logout", style: Theme.of(context).textTheme.subtitle1,),
        leading: Icon(Icons.logout),
        onTap: () {
        });
  }
}
