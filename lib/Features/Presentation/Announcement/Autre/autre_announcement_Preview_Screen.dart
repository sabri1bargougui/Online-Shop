import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Core/Shared/shared_preferences.dart';
import 'package:happy_shop/Core/Shared/user_info.dart';
import 'package:happy_shop/Features/Domain/Products/Product_Services.dart';
import 'package:happy_shop/Features/Presentation/Main/Main_Screen.dart';
import 'package:uuid/uuid.dart';

class AnnouncementAutrePreviewScreen extends StatefulWidget {
  final String categorie;
  final String announcementTitle;
  final String description;
  final String state;
  final double price;
  final String gouvernorate;
  final String delegation;

  final List<String> images;
  AnnouncementAutrePreviewScreen({
    Key? key,
    required this.categorie,
    required this.announcementTitle,
    required this.description,
    required this.images,
    required this.state,
    required this.price,
    required this.delegation,
    required this.gouvernorate,
  }) : super(key: key);

  @override
  _AnnouncementAutrePreviewScreenState createState() =>
      _AnnouncementAutrePreviewScreenState();
}

class _AnnouncementAutrePreviewScreenState
    extends State<AnnouncementAutrePreviewScreen> {
  Future getUserInfo() async {
    UserInfoData.username = (await SharedPreferncesService.getuserName())!;
    UserInfoData.userLastName =
        (await SharedPreferncesService.getuserLastName())!;
    UserInfoData.userEmail = (await SharedPreferncesService.getuserEmail())!;
    UserInfoData.userDate = (await SharedPreferncesService.getUserDate())!;
    UserInfoData.userID = (await SharedPreferncesService.getuserID())!;
    UserInfoData.userAvatarUrl =
        (await SharedPreferncesService.getUserImage())!;
    UserInfoData.userPhoneNumber =
        (await SharedPreferncesService.getuserPhone())!;
  }

  setSearchParam(String searchKey) {
    List<String> caseSearchList = [];
    String temp = "";
    for (int i = 0; i < searchKey.length; i++) {
      temp = temp + searchKey[i];
      caseSearchList.add(temp);
    }
    return caseSearchList;
  }

  ProductServices _productServices = ProductServices();

  Position? _position;
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  @override
  void didChangeDependencies() async {
    _position = await _getGeoLocationPosition();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: 90,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                publierAnnounce(width, context),
              ],
            ),
          ],
        ),
      ),
      appBar: new AppBar(
        bottomOpacity: 0.0,
        title: Center(
          child: new Text(
            "View Announcement",
            style:
                TextStyle(color: Colors.black, fontSize: width > 320 ? 20 : 13),
          ),
        ),
        leading: IconButton(
          color: Colors.black,
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Edit",
              style: TextStyle(
                color: Colors.red,
                fontSize: width > 320 ? 18 : 14,
              ),
            ),
          )
        ],
        backgroundColor: KbackgroundColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: Container(
                height: 113,
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  widget.images[0],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 200,
                                  child: Text(
                                    widget.announcementTitle,
                                    style: headline8,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "Condition :",
                                    style: headline5,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    widget.state,
                                    style: headline5,
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 300,
                                  height: 30,
                                  child: Row(
                                    children: [
                                      Text(
                                        widget.price.toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      Align(
                                        alignment: Alignment(0.6, -0.80),
                                        child: Text(
                                          "dt",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 8,
              color: Colors.grey[200],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Details', style: headline5),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Divider(
              thickness: 8,
              color: Colors.grey[200],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Description', style: headline5),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.description,
                style: headline9,
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding publierAnnounce(double width, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: width > 320 ? 320 : 300,
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlueAccent,
            ),
            onPressed: () async {
              final DateTime now = DateTime.now();
              final DateFormat formatter = DateFormat('yyyy-MM-dd');
              final String date = formatter.format(now);
              final String categorie = widget.categorie;
              final String condition = widget.state;
              final String delegation = widget.delegation;
              final String governorate =
                  widget.gouvernorate.replaceAll('Governorate', '');
              final double price = widget.price;
              final List<String> images = widget.images;
              final String announceID = UserInfoData.userID!;
              final String announceTitle = widget.announcementTitle;
              final String description = widget.description;
              final String createdAt = date;
              final String sellerID = UserInfoData.userID!;
              final String sellerName = UserInfoData.username!;
              final String sellerLastName = UserInfoData.userLastName!;
              final double sellerRank = 2.2;
              final String sellerDate = UserInfoData.userDate!;
              final String sellerAvatar = UserInfoData.userAvatarUrl!;
              final int? sellerPhone = UserInfoData.userPhoneNumber;
              final double longitude = _position!.longitude;
              final double latitude = _position!.latitude;
              final String idAnnounce = Uuid().v4();
              final List keyWords = setSearchParam(widget.announcementTitle);

              await _productServices
                  .createdAutreItem(
                    idAnnounce,
                    categorie,
                    condition,
                    delegation,
                    governorate,
                    price,
                    images,
                    announceID,
                    announceTitle,
                    description,
                    createdAt,
                    sellerID,
                    sellerName,
                    sellerLastName,
                    sellerRank,
                    sellerDate,
                    sellerAvatar,
                    sellerPhone,
                    longitude,
                    latitude,
                    keyWords,
                  )
                  .whenComplete(() => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ),
                      ));
            },
            child: Text(
              "Publish Announcement",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
