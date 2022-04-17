import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';

class AddCartScreen extends StatefulWidget {
  AddCartScreen({Key? key}) : super(key: key);

  @override
  _AddCartScreenState createState() => _AddCartScreenState();
}

final _name = TextEditingController();
final _cardNumber = TextEditingController();
final _expireDate = TextEditingController();
final _cvv = TextEditingController();
final _postalCode = TextEditingController();
final _formKey = GlobalKey<FormState>();
bool _checkbox = false;

class _AddCartScreenState extends State<AddCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KbackgroundColor,
        primary: true,
        toolbarHeight: 60,
        title: Row(
          children: [
            SizedBox(width: 65),
            Center(
              child: Text(
                "Ajouter une carte",
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // *** name *** //
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Nom", style: headline5),
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
                          } else {
                            return null;
                          }
                        },
                      ),

                      /// *** card number *** ///
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Numéro de carte",
                          style: headline5,
                        ),
                      ),
                      SizedBox(height: 8),

                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _cardNumber,
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
                          } else if (value.length < 14) {
                            return 'veuillez saisir une adresse e-mail valide';
                          } else {
                            return null;
                          }
                        },
                      ),

                      /// *** cvv + expiredate *** //
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "MM/AA                      ",
                                  style: headline5,
                                ),
                              ),
                              SizedBox(height: 8),
                              // **** expire date ***** //
                              Container(
                                width: 150,
                                child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  controller: _expireDate,
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
                                    } else if (value.length < 8 &&
                                        value.length > 8) {
                                      return 'veuillez saisir une adresse e-mail valide';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Code de sécurité     ",
                                  style: headline5,
                                ),
                              ),
                              SizedBox(height: 8),

                              // **** cvv ***** //
                              Container(
                                width: 150,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: _cvv,
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
                                    } else if (value.length < 8 &&
                                        value.length > 8) {
                                      return 'veuillez saisir une adresse e-mail valide';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Zip/Code Postal",
                          style: headline5,
                        ),
                      ),
                      SizedBox(height: 8),

                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _postalCode,
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
                          } else if (value.length < 14) {
                            return 'veuillez saisir une adresse e-mail valide';
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

            /// *** check box *** ///
            CheckboxListTile(
              checkColor: Colors.red,
              activeColor: Colors.transparent,
              title: Text("Rappelez-vous cette carte"),
              value: _checkbox,
              onChanged: (newValue) {
                setState(() {});
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            SizedBox(height: 130),

            /// **** button *** ///
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 350,
                  height: 70,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(243, 224, 8, 1),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Ajouter carte',
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
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
