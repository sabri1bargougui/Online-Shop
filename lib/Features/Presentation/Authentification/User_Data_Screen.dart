import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:happy_shop/Core/Design/constant.dart';

import 'package:happy_shop/Features/Domain/Auth/auth.dart';
import 'package:happy_shop/Features/Presentation/Main/Main_Screen.dart';

class UserDataScreen extends StatefulWidget {
  final String phoneNumber;
  UserDataScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _UserDataScreenState createState() => _UserDataScreenState();
}

final RegExp emailRegex = new RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
final _name = TextEditingController();
final _lastName = TextEditingController();
final _email = TextEditingController();
final _formKey = GlobalKey<FormState>();
AuthServices _authServices = AuthServices();
final FirebaseAuth _auth = FirebaseAuth.instance;
User? user = _auth.currentUser;

class _UserDataScreenState extends State<UserDataScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 60),
            Center(
              child: new Text(
                "Create an Account",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        leading: IconButton(
          color: Colors.black,
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LinearProgressIndicator(
              backgroundColor: Colors.black12,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.black,
              ),
              value: 0.8,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Personal Information",
                  style: headine2,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Please enter your Personal Information",
                  style: headline7,
                ),
              ),
            ),
            SizedBox(height: height > 600 ? 40 : 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // ** name  ** //
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Name",
                          style: headline6,
                        ),
                      ),
                      SizedBox(height: 8),

                      TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your first name';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      // ** name  ** //
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Last Name",
                          style: headline6,
                        ),
                      ),
                      SizedBox(height: 8),

                      TextFormField(
                        controller: _lastName,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your first last name';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "E-mail",
                          style: headline6,
                        ),
                      ),
                      SizedBox(height: 8),
                      // email //
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your email';
                          } else if (!emailRegex.hasMatch(value)) {
                            return 'please enter valid email address';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: (height > 820)
                  ? 150
                  : (height > 620)
                      ? 90
                      : 10,
            ),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final email = _email.text;
                  final lastname = _lastName.text;
                  final name = _name.text;
                  final phonenumber = int.parse(widget.phoneNumber);
                  final avatarurl =
                      "https://storage.googleapis.com/stateless-campfire-pictures/2019/05/e4629f8e-defaultuserimage-15579880664l8pc.jpg";
                  final DateTime now = DateTime.now();
                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                  final String date = formatter.format(now);

                  await _authServices
                      .signup(
                        email,
                        name,
                        lastname,
                        phonenumber,
                        avatarurl,
                        date,
                      )
                      .whenComplete(() => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(),
                            ),
                          ));
                }
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
