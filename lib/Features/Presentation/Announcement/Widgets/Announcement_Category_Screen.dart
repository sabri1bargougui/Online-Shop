import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Announcement/Widgets/Announcement_Images_Screen.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SelectCtegoryScreen extends StatefulWidget {
  final String announcementTitle;
  final String decription;
  SelectCtegoryScreen({
    Key? key,
    required this.announcementTitle,
    required this.decription,
  }) : super(key: key);

  @override
  _SelectCtegoryScreenState createState() => _SelectCtegoryScreenState();
}

class _SelectCtegoryScreenState extends State<SelectCtegoryScreen> {
  bool _isInformatiqueSelected = false;
  bool _isMultimediaSelected = false;
  bool _isVoitureSelected = false;
  bool _isMotoSelected = false;
  bool _isImmobilierSelected = false;
  bool _isAutreSelected = false;
  String? _categorie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: new AppBar(
        title: Row(
          children: [
            SizedBox(width: 70),
            Center(
              child: new Text(
                "Categories",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            LinearProgressIndicator(
              backgroundColor: Colors.black12,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.black,
              ),
              value: 0.3,
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Choose a category",
                      style: headine2,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad",
                    style: headline7,
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isInformatiqueSelected = !_isInformatiqueSelected;
                        _isMultimediaSelected = false;
                        _isVoitureSelected = false;
                        _isMotoSelected = false;
                        _isImmobilierSelected = false;
                        _isAutreSelected = false;
                        _categorie = "Informatique";
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child: Card(
                        shape: _isInformatiqueSelected
                            ? RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )
                            : RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                        elevation: 0,
                        shadowColor: Colors.grey,
                        color: Colors.white,
                        child: Container(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    bottom: 24,
                                  ),
                                  child: Text(
                                    "Technologies",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: SvgPicture.asset(
                                  "assets/icons/computer.svg",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isMultimediaSelected = !_isMultimediaSelected;
                        _isInformatiqueSelected = false;
                        _isAutreSelected = false;
                        _isVoitureSelected = false;
                        _isMotoSelected = false;
                        _isImmobilierSelected = false;
                        _categorie = "Multimédia";
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child: Card(
                        shape: _isMultimediaSelected
                            ? RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )
                            : RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                        elevation: 0,
                        shadowColor: Colors.grey,
                        color: Colors.white,
                        child: Container(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    bottom: 24,
                                  ),
                                  child: Text(
                                    "Multimedia",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: SvgPicture.asset(
                                  "assets/icons/video.svg",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isVoitureSelected = !_isVoitureSelected;
                        _isMultimediaSelected = false;
                        _isInformatiqueSelected = false;
                        _isAutreSelected = false;
                        _isMotoSelected = false;
                        _isImmobilierSelected = false;
                        _categorie = "Voitures";
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child: Card(
                        shape: _isVoitureSelected
                            ? RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )
                            : RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                        elevation: 0,
                        shadowColor: Colors.grey,
                        color: Colors.white,
                        child: Container(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    bottom: 24,
                                  ),
                                  child: Text(
                                    "Cars",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: SvgPicture.asset(
                                  "assets/icons/car.svg",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isMotoSelected = !_isMotoSelected;
                        _isVoitureSelected = false;
                        _isMultimediaSelected = false;
                        _isInformatiqueSelected = false;
                        _isAutreSelected = false;
                        _isImmobilierSelected = false;
                        _categorie = "Motos";
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child: Card(
                        shape: _isMotoSelected
                            ? RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )
                            : RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                        elevation: 0,
                        shadowColor: Colors.grey,
                        color: Colors.white,
                        child: Container(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    bottom: 24,
                                  ),
                                  child: Text(
                                    "Motors",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: SvgPicture.asset(
                                  "assets/icons/motorcycle.svg",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isImmobilierSelected = !_isImmobilierSelected;
                        _isMotoSelected = false;
                        _isVoitureSelected = false;
                        _isMultimediaSelected = false;
                        _isInformatiqueSelected = false;
                        _isAutreSelected = false;
                        _categorie = "Immobilier";
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child: Card(
                        shape: _isImmobilierSelected
                            ? RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )
                            : RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                        elevation: 0,
                        shadowColor: Colors.grey,
                        color: Colors.white,
                        child: Container(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    bottom: 24,
                                  ),
                                  child: Text(
                                    "Real estate",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: SvgPicture.asset(
                                  "assets/icons/hotel.svg",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isAutreSelected = !_isAutreSelected;
                        _isMotoSelected = false;
                        _isVoitureSelected = false;
                        _isMultimediaSelected = false;
                        _isImmobilierSelected = false;
                        _isInformatiqueSelected = false;
                        _categorie = "Autres";
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child: Card(
                        shape: _isAutreSelected
                            ? RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )
                            : RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                        elevation: 0,
                        shadowColor: Colors.grey,
                        color: Colors.white,
                        child: Container(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    bottom: 24,
                                  ),
                                  child: Text(
                                    "Others",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: SvgPicture.asset(
                                  "assets/icons/hotel.svg",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// **** button *** ///
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        width: 360,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          onPressed: () {
                            if (_categorie == null) {
                              showTopSnackBar(
                                context,
                                CustomSnackBar.info(
                                  backgroundColor: Colors.white,
                                  message:
                                      "Please choose from the following categories",
                                  textStyle: TextStyle(color: Colors.red),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AnnouncementImageAddScreen(
                                    announcementTitle: widget.announcementTitle,
                                    categorie: _categorie.toString(),
                                    description: widget.decription,
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
            ),
          ],
        ),
      ),
    );
  }
}
