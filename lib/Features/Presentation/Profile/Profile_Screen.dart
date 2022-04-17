import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Domain/Auth/auth.dart';
import 'package:happy_shop/Features/Presentation/Authentification/Login_screen.dart';
import 'package:happy_shop/Features/Presentation/Profile/My_Announces/my_Announce_Screen.dart';
import 'package:happy_shop/Features/Presentation/Profile/My_Favorite/My_Favorite_Screen.dart';
import 'package:happy_shop/Features/Presentation/Profile/My_Orders/my_Order_Screen.dart';
import 'package:happy_shop/Features/Presentation/Profile/Photo/add_picture_screen.dart';
import 'package:happy_shop/Features/Presentation/Profile/My_Profile/profile_informations_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Payment_Methodes/payment_methode_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthServices _authServices = AuthServices();

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  Future clearShared() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.clear();
  }

  final picker = ImagePicker();
  File? _image;

  _showMaterialDialog() {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: const Text("Oops..!"),
        content: const Text("Please select image !"),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok!'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  void _imagepick() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(
      () {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          _showMaterialDialog();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: new AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await clearShared()
                    .whenComplete(() => _auth.signOut())
                    .whenComplete(() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        ));
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
                size: 30,
              )),
        ],
        bottomOpacity: 0.0,
        title: Row(
          children: [
            SizedBox(width: width > 320 ? 150 : 60),
            Center(
              child: new Text(
                "Profile",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        backgroundColor: KbackgroundColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            StreamBuilder<DocumentSnapshot>(
              stream: _authServices.getUserInfo(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(
                    color: Colors.yellow,
                  );
                } else if (snapshot.connectionState == ConnectionState.active) {
                  return Column(
                    children: [
                      (_image == null)
                          ? Stack(children: [
                              CircleAvatar(
                                radius: 50.0,
                                backgroundImage: NetworkImage(
                                  snapshot.data!['avatarurl'],
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                              Positioned(
                                left: 50,
                                top: 50,
                                child: IconButton(
                                    onPressed: _imagepick,
                                    icon: Icon(
                                      Icons.edit,
                                    )),
                              )
                            ])
                          : Stack(children: [
                              CircleAvatar(
                                radius: 50.0,
                                backgroundImage: FileImage(_image!),
                                backgroundColor: Colors.transparent,
                              ),
                              Positioned(
                                left: 50,
                                top: 50,
                                child: IconButton(
                                    onPressed: _imagepick,
                                    icon: Icon(
                                      Icons.edit,
                                    )),
                              )
                            ]),
                      SizedBox(height: 10),
                      Text(
                        snapshot.data!['name'].toString().toUpperCase() +
                            ' ' +
                            snapshot.data!['lastname'].toString().toUpperCase(),
                        style: headline12,
                      ),
                    ],
                  );
                } else
                  return Text('d');
              },
            ),
            SizedBox(height: 10),
            Column(
              children: [
                // profile //
                ListTile(
                  dense: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileInformationScreen()),
                    );
                  },
                  title: Text(
                    "Profile",
                    style: headline23,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey[200],
                  ),
                ),
                // photo //
                ListTile(
                  dense: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddPictureScreen(),
                      ),
                    );
                  },
                  title: Text(
                    "Photo",
                    style: headline23,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey[200],
                  ),
                ),
                ListTile(
                  dense: true,
                  onTap: () {},
                  title: Text(
                    "Account",
                    style: headline23,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey[200],
                  ),
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyPaymentMethodesScreen(),
                      ),
                    );
                  },
                  title: Text(
                    "Payement Methode",
                    style: headline23,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey[200],
                  ),
                ),
                /////  *** My Account **** ////

                ListTile(
                  dense: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyAnnounceScreen(),
                      ),
                    );
                  },
                  title: Text(
                    "My Aannouncement",
                    style: headline23,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey[200],
                  ),
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyFavoriteScreen(),
                      ),
                    );
                  },
                  title: Text(
                    "My Favorite",
                    style: headline23,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey[200],
                  ),
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyOrderScreen(),
                      ),
                    );
                  },
                  title: Text(
                    "My Purchase",
                    style: headline23,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey[200],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
