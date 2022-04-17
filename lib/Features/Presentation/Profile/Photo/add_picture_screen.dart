// ignore_for_file: unused_field

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Core/Shared/shared_preferences.dart';
import 'package:happy_shop/Features/Domain/Auth/auth.dart';
import 'package:happy_shop/Features/Presentation/Main/Main_Screen.dart';

class AddPictureScreen extends StatefulWidget {
  AddPictureScreen({Key? key}) : super(key: key);

  @override
  _AddPictureScreenState createState() => _AddPictureScreenState();
}

class _AddPictureScreenState extends State<AddPictureScreen> {
  FToast? fToast;

  AuthServices _authServices = AuthServices();
  final picker = ImagePicker();
  File? _image1;
  String? urlimage;

  final _formKey = GlobalKey<FormState>();

  void _imagepick1() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final Reference storageRef = FirebaseStorage.instance
          .ref(pickedFile.path)
          .child("User_Profile_image");
      final taskSnapshot = await storageRef.putFile(
        File(pickedFile.path),
      );
      String url1 = await taskSnapshot.ref.getDownloadURL();

      setState(
        () {
          _image1 = File(pickedFile.path);
          urlimage = url1;
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast!.init(context);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: new AppBar(
        bottomOpacity: 0.0,
        title: Row(
          children: [
            SizedBox(width: width > 320 ? 90 : 40),
            Center(
              child: new Text(
                "Compte",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: KbackgroundColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Center(
              child: Text(
                "Photo",
                style: headine20,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 300,
              child: Center(
                child: Text(
                  'Ajouter une photo  sympa de vous',
                  style: headline7,
                ),
              ),
            ),
            Container(
              width: 300,
              child: Center(
                child: Text(
                  'pour votre profil',
                  style: headline7,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Divider(
                thickness: 4,
                color: Colors.grey[300],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 16,
                    bottom: 5,
                    top: 20,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Aperçu de l'image",
                      style: headline6,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16.0, right: 16, top: 10),
                      child: Column(
                        children: [
                          (_image1 != null)
                              ? Image(
                                  width: 400,
                                  height: 300,
                                  image: FileImage(
                                    _image1!,
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : Image(
                                  width: 400,
                                  height: 300,
                                  image: AssetImage(
                                      "assets/images/placeholder.png"),
                                  fit: BoxFit.cover,
                                )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 16,
                    bottom: 5,
                    top: 20,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Ajouter/Modifier l'image",
                      style: headline6,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey[400]!)),
                        width: 185,
                        height: 40,
                        child: Center(
                          child: _image1 == null
                              ? Text('aucune fichier selectionner!')
                              : Text("Image sélectionnée"),
                        ),
                      ),
                      TextButton(
                        onPressed: _imagepick1,
                        child: Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Telecharger une photo',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),

            /// Button ///
            TextButton(
              onPressed: () async {
                await _authServices
                    .updateUserPhoto(urlimage)
                    .whenComplete(
                        () => SharedPreferncesService.saveUserImage(urlimage!))
                    .whenComplete(() => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()),
                        ));
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 55,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Sauvegarder',
                  style: TextStyle(
                    color: Colors.black,
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
