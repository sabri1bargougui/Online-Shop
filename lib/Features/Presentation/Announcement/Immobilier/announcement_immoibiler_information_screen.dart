import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Announcement/Immobilier/announcement_state&price_immobilier_screen.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AnnouncementInformationImmobilierScreen extends StatefulWidget {
  final String announcmentTitle;
  final String categorie;
  final String description;
  final List<String> urls;

  AnnouncementInformationImmobilierScreen({
    Key? key,
    required this.announcmentTitle,
    required this.categorie,
    required this.description,
    required this.urls,
  }) : super(key: key);

  @override
  _AnnouncementInformationImmobilierScreenState createState() =>
      _AnnouncementInformationImmobilierScreenState();
}

class _AnnouncementInformationImmobilierScreenState
    extends State<AnnouncementInformationImmobilierScreen> {
  final _roomNumber = TextEditingController();
  final _surface = TextEditingController();
  final _terrain = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _fournished = false;
  bool _isNotFournished = false;
  String? fournished;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 50),
            Center(
              child: new Text(
                "Publish an announcement",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: KbackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Describe your Product !',
                  style: headine20,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Text(
                'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..',
                style: headline7,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // **  Item name ** //

                      // console Type ** ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Room Number:',
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 150,
                                height: 50,
                                child: TextFormField(
                                  controller: _roomNumber,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Room Number',
                                    hintStyle: TextStyle(fontSize: 13),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'veuillez saisir le nombre de chambres';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Furnished/Unfurnished:',
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _fournished = true;
                                    _isNotFournished = false;
                                    fournished = 'Meublé';
                                  });
                                },
                                child: Container(
                                  width: 150,
                                  height: 50,
                                  child: Card(
                                    shape: _fournished
                                        ? RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Colors.black,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )
                                        : RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                    shadowColor: Colors.grey,
                                    child: Center(
                                      child: Text(
                                        'Furnished',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: _fournished
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _fournished = false;
                                    _isNotFournished = true;
                                    fournished = 'Non Meublé';
                                  });
                                },
                                child: Container(
                                  width: 150,
                                  height: 50,
                                  child: Card(
                                    shape: _isNotFournished
                                        ? RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Colors.black,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )
                                        : RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                    shadowColor: Colors.grey,
                                    child: Center(
                                      child: Text(
                                        'Unfurnished',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: _isNotFournished
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      // console Type ** ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Text(
                              'Surface :',
                            ),
                          ),
                          Container(
                            width: 220,
                            height: 50,
                            child: TextFormField(
                              controller: _surface,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'surface (exp : 200 m² )',
                                hintStyle: TextStyle(fontSize: 13),
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
                                  return 'veuillez saisir le surface';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // console Type ** ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Text(
                              'Ground :',
                            ),
                          ),
                          Container(
                            width: 220,
                            height: 50,
                            child: TextFormField(
                              controller: _terrain,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Ground',
                                hintStyle: TextStyle(fontSize: 13),
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
                                  return 'veuillez saisir le terrain';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height > 820 ? 0 : 0),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final String categorie = widget.categorie;
                  final String announcementTitle = widget.announcmentTitle;
                  final String description = widget.description;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StateAndPriceImmobilierItemScreen(
                        announcementTitle: announcementTitle,
                        categorie: categorie,
                        description: description,
                        roomNumber: int.parse(_roomNumber.text),
                        surface: double.parse(_surface.text),
                        terrain: double.parse(_terrain.text),
                        fournished: fournished!,
                        urls: widget.urls,
                      ),
                    ),
                  );
                } else if (fournished!.isEmpty) {
                  showTopSnackBar(
                    context,
                    CustomSnackBar.info(
                      backgroundColor: Colors.white,
                      message: "Veuillez remplir les champs ",
                      textStyle: TextStyle(color: Colors.red),
                    ),
                  );
                }
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 60,
                width: 340,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
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
