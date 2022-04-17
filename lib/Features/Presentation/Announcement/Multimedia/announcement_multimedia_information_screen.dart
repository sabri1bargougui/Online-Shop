import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Announcement/Multimedia/announcement_state&price_multimedia_screen.dart';

class AnnouncementInformationMultemediaScreen extends StatefulWidget {
  final String announcmentTitle;
  final String categorie;
  final String description;
  final List<String> urls;

  AnnouncementInformationMultemediaScreen({
    Key? key,
    required this.announcmentTitle,
    required this.categorie,
    required this.urls,
    required this.description,
  }) : super(key: key);

  @override
  _AnnouncementInformationMultemediaScreenState createState() =>
      _AnnouncementInformationMultemediaScreenState();
}

class _AnnouncementInformationMultemediaScreenState
    extends State<AnnouncementInformationMultemediaScreen> {
  final _marque = TextEditingController();
  final _model = TextEditingController();
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
                  'Describe Your Product !',
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
                              'Brand',
                            ),
                          ),
                          Container(
                            width: 220,
                            height: 50,
                            child: TextFormField(
                              controller: _marque,
                              decoration: InputDecoration(
                                hintText: 'Brand',
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
                                  return 'veuillez saisir la marque';
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
                              'Model',
                            ),
                          ),
                          Container(
                            width: 220,
                            height: 50,
                            child: TextFormField(
                              controller: _model,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Model',
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
                                  return 'veuillez saisir le modéle';
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
                              'Generic Name :',
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

                  final String description = widget.description;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StateAndPriceMultimediaItemScreen(
                        announcementTitle: announcementTitle,
                        categorie: categorie,
                        description: description,
                        urls: widget.urls,
                        genericeName: _genericeName.text,
                        marque: _marque.text,
                        model: _model.text,
                        modelNumber: _modelNumber.text,
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
