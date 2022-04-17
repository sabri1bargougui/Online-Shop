import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Core/Shared/user_info.dart';

class ProfileInformationScreen extends StatefulWidget {
  ProfileInformationScreen({Key? key}) : super(key: key);

  @override
  _ProfileInformationScreenState createState() =>
      _ProfileInformationScreenState();
}

class _ProfileInformationScreenState extends State<ProfileInformationScreen> {
  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  final _name = TextEditingController(text: UserInfoData.username);
  final _lastName = TextEditingController(text: UserInfoData.userLastName);
  final _fonction = TextEditingController();
  final _description = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                "Profil publique",
                style: headine20,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                "Ajouter des informations vous concernant",
                style: headline7,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Divider(
                thickness: 4,
                color: Colors.grey[300],
              ),
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
                  "Informations de base",
                  style: headline6,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // ** name  ** //
                      SizedBox(height: 8),

                      TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[400]!),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey[50]!,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'veuillez saisir votre  Prénom';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      // ** name  ** //

                      TextFormField(
                        controller: _lastName,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[400]!),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey[50]!,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'veuillez saisir votre  Nom';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      // Fonction //
                      TextFormField(
                        controller: _fonction,
                        decoration: InputDecoration(
                          hintText: 'Fonction',
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[400]!),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey[50]!,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'veuillez saisir votre fonction';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      // Description ///
                      TextFormField(
                        maxLines: 7,
                        controller: _description,
                        decoration: InputDecoration(
                          hintText: 'Ecrire une description ici',
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[400]!),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey[50]!,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'veuillez saisir une description';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 70),

            /// Button ///
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {}
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
