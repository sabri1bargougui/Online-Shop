import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';

import 'package:happy_shop/Features/Presentation/Main/Main_Screen.dart';
import 'package:happy_shop/Features/Presentation/Payment/Payment_Screen.dart';

class UserInfoScreen extends StatefulWidget {
  UserInfoScreen({Key? key}) : super(key: key);

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  final _name = TextEditingController();
  final _lastname = TextEditingController();
  final _phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,
        backgroundColor: KbackgroundColor,
        primary: true,
        toolbarHeight: 60,
        title: Center(
          child: Text(
            "Étape2/3-Info",
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Information personnelles",
                  style: headine3,
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 300,
                  child: Text(
                    "Une piéce d'identité vous sera demandée pour récupérer votre colis",
                    style: headine4,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 16),
                child: Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // ** name and last name ** //
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Prénom", style: headline5),
                        ),
                        SizedBox(height: 8),

                        TextFormField(
                          controller: _lastname,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'veuillez saisir votre  Nom & Prénom';
                            } else if (!emailRegex.hasMatch(value)) {
                              return 'veuillez saisir une adresse e-mail valide';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Nom",
                            style: headline5,
                          ),
                        ),
                        SizedBox(height: 8),

                        TextFormField(
                          controller: _name,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'veuillez saisir votre  Nom & Prénom';
                            } else if (!emailRegex.hasMatch(value)) {
                              return 'veuillez saisir une adresse e-mail valide';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Numéro de téléphone",
                            style: headline5,
                          ),
                        ),
                        SizedBox(height: 8),
                        // **** Phone ***** //
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: _phone,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'veuillez saisir une adresse e-mail valide';
                            } else if (value.length < 8 && value.length > 8) {
                              return 'veuillez saisir une adresse e-mail valide';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),

              /// **** add new phone **** ///
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Text(
                        "Ajouter un autre numéro de téléphone",
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: "Regular",
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: height > 580 ? 180 : 40),
              //// ** button *** ///
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(243, 224, 8, 1),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Étape3/3 : payer',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
