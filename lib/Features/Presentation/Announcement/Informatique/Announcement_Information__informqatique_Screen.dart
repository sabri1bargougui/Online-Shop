import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Announcement/Informatique/Announcement_State&price_Informqtique_Screen.dart';

class AnnouncementInformationInformqtiqueScreen extends StatefulWidget {
  final String announcmentTitle;
  final String categorie;
  final String description;
  final List<String> urls;

  AnnouncementInformationInformqtiqueScreen({
    Key? key,
    required this.announcmentTitle,
    required this.categorie,
    required this.urls,
    required this.description,
  }) : super(key: key);

  @override
  _AnnouncementInformationInformqtiqueScreenState createState() =>
      _AnnouncementInformationInformqtiqueScreenState();
}

class _AnnouncementInformationInformqtiqueScreenState
    extends State<AnnouncementInformationInformqtiqueScreen> {
  final _cosoleType = TextEditingController();
  final _garanti = TextEditingController();
  final _garantiType = TextEditingController();
  final _modelNumber = TextEditingController();
  final _genericeName = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                "Publish Announcement",
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
                  'Describe your product !',
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
                      // console Type ** ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Text(
                              'Console Type :',
                            ),
                          ),
                          Container(
                            width: 220,
                            height: 50,
                            child: TextFormField(
                              controller: _cosoleType,
                              decoration: InputDecoration(
                                hintText: 'Console Type',
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
                                  return 'veuillez saisir le type de console';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // console Type ** ///ype de console
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Text(
                              'Warranty :',
                            ),
                          ),
                          Container(
                            width: 220,
                            height: 50,
                            child: TextFormField(
                              controller: _garanti,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Warranty (exp : 1 ans )',
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
                                  return 'veuillez saisir le delai de garentie';
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
                              'Warranty Type :',
                            ),
                          ),
                          Container(
                            width: 220,
                            height: 50,
                            child: TextFormField(
                              controller: _garantiType,
                              decoration: InputDecoration(
                                hintText: 'Guarantee type',
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
                                  return 'veuillez saisir le type de garentie';
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
                              'Model Number :',
                            ),
                          ),
                          Container(
                            width: 220,
                            height: 50,
                            child: TextFormField(
                              controller: _modelNumber,
                              decoration: InputDecoration(
                                hintText: 'Model Number',
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
                                  return 'veuillez saisir le numéro de modéle';
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
                              'generic name:',
                            ),
                          ),
                          Container(
                            width: 220,
                            height: 50,
                            child: TextFormField(
                              controller: _genericeName,
                              decoration: InputDecoration(
                                hintText: 'generic name',
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
                                  return 'veuillez saisir le nom générique';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      //***  Description ***  ///
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
                  final String consoleType = _cosoleType.text;
                  final int garentie = int.parse(_garanti.text);
                  final String garentiType = _garantiType.text;
                  final String modelNumber = _modelNumber.text;
                  final String genericName = _genericeName.text;
                  final String description = widget.description;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StateAndPriceInformqtiqueItemScreen(
                        announcementTitle: announcementTitle,
                        categorie: categorie,
                        consoleType: consoleType,
                        description: description,
                        garentie: garentie,
                        garentieType: garentiType,
                        genericName: genericName,
                        modelNumber: modelNumber,
                        urls: widget.urls,
                      ),
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
