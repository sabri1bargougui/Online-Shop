import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Announcement/Autre/Autre_Announcemet_State&Price.dart';
import 'package:happy_shop/Features/Presentation/Announcement/Immobilier/announcement_immoibiler_information_screen.dart';
import 'package:happy_shop/Features/Presentation/Announcement/Informatique/Announcement_Information__informqatique_Screen.dart';
import 'package:happy_shop/Features/Presentation/Announcement/Motos/announcement_motos_information_screen.dart';
import 'package:happy_shop/Features/Presentation/Announcement/Multimedia/announcement_multimedia_information_screen.dart';
import 'package:happy_shop/Features/Presentation/Announcement/Voiture/announcement_car_information.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AnnouncementImageAddScreen extends StatefulWidget {
  final String announcementTitle;
  final String categorie;
  final String description;
  AnnouncementImageAddScreen({
    Key? key,
    required this.announcementTitle,
    required this.categorie,
    required this.description,
  }) : super(key: key);

  @override
  _AnnouncementImageAddScreenState createState() =>
      _AnnouncementImageAddScreenState();
}

class _AnnouncementImageAddScreenState
    extends State<AnnouncementImageAddScreen> {
  final picker = ImagePicker();
  File? _image1;
  File? _image2;
  File? _image3;
  File? _image4;
  File? _image5;
  File? _image6;
  List<String> images = [];
  void _imagepick1() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final Reference storageRef =
          FirebaseStorage.instance.ref(pickedFile.path).child("Items");
      final taskSnapshot = await storageRef.putFile(
        File(pickedFile.path),
      );
      String url1 = await taskSnapshot.ref.getDownloadURL();
      images.insert(0, url1);
      setState(
        () {
          _image1 = File(pickedFile.path);
        },
      );
    }
  }

  void _imagepick2() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final Reference storageRef =
          FirebaseStorage.instance.ref(pickedFile.path).child("Items");
      final taskSnapshot = await storageRef.putFile(
        File(pickedFile.path),
      );
      String url2 = await taskSnapshot.ref.getDownloadURL();
      images.insert(1, url2);
      setState(
        () {
          _image2 = File(pickedFile.path);
        },
      );
    }
  }

  void _imagepick3() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final Reference storageRef =
          FirebaseStorage.instance.ref(pickedFile.path).child("Items");
      final taskSnapshot = await storageRef.putFile(
        File(pickedFile.path),
      );
      String url3 = await taskSnapshot.ref.getDownloadURL();
      images.insert(2, url3);
      setState(
        () {
          _image3 = File(pickedFile.path);
        },
      );
    }
  }

  void _imagepick4() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final Reference storageRef =
          FirebaseStorage.instance.ref(pickedFile.path).child("Items");
      final taskSnapshot = await storageRef.putFile(
        File(pickedFile.path),
      );
      String url4 = await taskSnapshot.ref.getDownloadURL();
      images.insert(3, url4);
      setState(
        () {
          _image4 = File(pickedFile.path);
        },
      );
    }
  }

  void _imagepick5() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final Reference storageRef =
          FirebaseStorage.instance.ref(pickedFile.path).child("Items");
      final taskSnapshot = await storageRef.putFile(
        File(pickedFile.path),
      );
      String url5 = await taskSnapshot.ref.getDownloadURL();
      images.insert(4, url5);
      setState(
        () {
          _image5 = File(pickedFile.path);
        },
      );
    }
  }

  void _imagepick6() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final Reference storageRef =
          FirebaseStorage.instance.ref(pickedFile.path).child("Items");
      final taskSnapshot = await storageRef.putFile(
        File(pickedFile.path),
      );
      String url6 = await taskSnapshot.ref.getDownloadURL();
      images.insert(5, url6);
      setState(
        () {
          _image6 = File(pickedFile.path);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KbackgroundColor,
      appBar: new AppBar(
        title: Row(
          children: [
            SizedBox(width: 90),
            Center(
              child: new Text(
                "Photos",
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
              value: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Add pictures",
                      style: headine2,
                    ),
                  ),
                  SizedBox(height: 20),

                  Align(
                    alignment: Alignment.topLeft,
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: (1.7 / 1),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      //physics:BouncingScrollPhysics(),
                      padding: EdgeInsets.only(left: 0, right: 0, top: 20),
                      children: <Widget>[
                        (_image1 != null)
                            ? Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: FileImage(_image1!),
                                  fit: BoxFit.cover,
                                )),
                                width: 200,
                                height: 200,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _image1 = null;
                                        images.removeAt(0);
                                      });
                                    },
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: _imagepick1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  width: 120,
                                  height: 120,
                                  child: Center(
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ),
                        /////////////////////////:
                        (_image2 != null)
                            ? Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: FileImage(_image2!),
                                  fit: BoxFit.cover,
                                )),
                                width: 120,
                                height: 120,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _image2 = null;
                                        images.removeAt(1);
                                      });
                                    },
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: _imagepick2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  width: 120,
                                  height: 120,
                                  child: Center(
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ),
                        ///////////////////////////
                        (_image3 != null)
                            ? Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: FileImage(_image3!),
                                  fit: BoxFit.cover,
                                )),
                                width: 120,
                                height: 120,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _image3 = null;
                                        images.removeAt(2);
                                      });
                                    },
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: _imagepick3,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  width: 120,
                                  height: 120,
                                  child: Center(
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ),

                        //////////////////////////
                        (_image4 != null)
                            ? Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: FileImage(_image4!),
                                  fit: BoxFit.cover,
                                )),
                                width: 120,
                                height: 120,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _image4 = null;
                                        images.removeAt(3);
                                      });
                                    },
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: _imagepick4,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  width: 120,
                                  height: 120,
                                  child: Center(
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ),
                        ///////////////////////////
                        (_image5 != null)
                            ? Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: FileImage(_image5!),
                                  fit: BoxFit.cover,
                                )),
                                width: 120,
                                height: 120,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _image5 = null;
                                        images.removeAt(4);
                                      });
                                    },
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: _imagepick5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  width: 120,
                                  height: 120,
                                  child: Center(
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ),
                        /////////////////////////////
                        (_image6 != null)
                            ? Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: FileImage(_image6!),
                                  fit: BoxFit.cover,
                                )),
                                width: 120,
                                height: 120,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _image6 = null;
                                        images.removeAt(5);
                                      });
                                    },
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: _imagepick6,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  width: 120,
                                  height: 120,
                                  child: Center(
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ),
                        /////////////////////////////
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  /// *** Button **** ///
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0, top: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        width: 370,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          onPressed: () {
                            if (images.length < 3) {
                              showTopSnackBar(
                                context,
                                CustomSnackBar.info(
                                  backgroundColor: Colors.white,
                                  message: "Veuillez ajouter au moins 3 photos",
                                  textStyle: TextStyle(color: Colors.red),
                                ),
                              );
                            } else if (widget.categorie == 'Informatique') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AnnouncementInformationInformqtiqueScreen(
                                    announcmentTitle: widget.announcementTitle,
                                    categorie: widget.categorie,
                                    urls: images,
                                    description: widget.description,
                                  ),
                                ),
                              );
                            } else if (widget.categorie == "Immobilier") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AnnouncementInformationImmobilierScreen(
                                    announcmentTitle: widget.announcementTitle,
                                    categorie: widget.categorie,
                                    description: widget.description,
                                    urls: images,
                                  ),
                                ),
                              );
                            } else if (widget.categorie == 'Voitures') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AnnouncementInformationCarScreen(
                                    announcmentTitle: widget.announcementTitle,
                                    categorie: widget.categorie,
                                    urls: images,
                                    description: widget.description,
                                  ),
                                ),
                              );
                            } else if (widget.categorie == 'Multimédia') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AnnouncementInformationMultemediaScreen(
                                    announcmentTitle: widget.announcementTitle,
                                    categorie: widget.categorie,
                                    description: widget.description,
                                    urls: images,
                                  ),
                                ),
                              );
                            } else if (widget.categorie == 'Motos') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AnnouncementInformationMotoScreen(
                                    announcmentTitle: widget.announcementTitle,
                                    categorie: widget.categorie,
                                    description: widget.description,
                                    urls: images,
                                  ),
                                ),
                              );
                            } else if (widget.categorie == 'Autres') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      StateAndPriceAutreItemScreen(
                                    categorie: widget.categorie,
                                    description: widget.description,
                                    urls: images,
                                    announcementTitle: widget.announcementTitle,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
