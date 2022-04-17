import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:readmore/readmore.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Core/Shared/shared_preferences.dart';
import 'package:happy_shop/Core/Shared/user_info.dart';
import 'package:happy_shop/Features/Domain/Products/Product_Services.dart';
import 'package:happy_shop/Features/Presentation/Payment/Delivery_Address_Screen.dart';
import 'package:happy_shop/Features/Presentation/Product/For_You_Screen/For_You_Screen.dart';
import 'package:happy_shop/Features/Presentation/Product/Widget/Contact_Seller_Widget.dart';

class MultiMediaDetailsScreen extends StatefulWidget {
  final String? categorie;
  final String? condition;
  final String? delegation;
  final String? governorate;
  final List? images;
  final String? announceID;
  final String? announceTitle;
  final String? description;
  final String? sellerID;
  final String? sellerName;
  final String? idAnnounce;

  final double? sellerRank;
  final String? sellerDate;
  final String? sellerAvatar;
  final int? sellerPhone;
  final double? price;
  final double? longitude;
  final double? latitude;
  final String? createdAt;

  /// Informatique ////

  final String? marque;
  final String? model;
  final String? genericName;
  final String? modelNumber;

  MultiMediaDetailsScreen({
    Key? key,
    this.categorie,
    this.condition,
    this.delegation,
    this.governorate,
    this.images,
    this.announceID,
    this.announceTitle,
    this.description,
    this.sellerID,
    this.sellerName,
    this.sellerRank,
    this.sellerDate,
    this.sellerAvatar,
    this.sellerPhone,
    this.price,
    this.longitude,
    this.latitude,
    this.createdAt,
    this.genericName,
    this.modelNumber,
    this.marque,
    this.model,
    this.idAnnounce,
  }) : super(key: key);

  @override
  _MultiMediaDetailsScreenState createState() =>
      _MultiMediaDetailsScreenState();
}

class _MultiMediaDetailsScreenState extends State<MultiMediaDetailsScreen> {
  ProductServices _productServices = ProductServices();
  int? announceNumber;
  int? count;
  _getAnnounceNumberOfSeller() async {
    int numbr = await _productServices.getCount(sellerid: widget.sellerID);

    setState(() {
      announceNumber = numbr;
    });
  }

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

  @override
  void initState() {
    _getAnnounceNumberOfSeller();
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: widget.sellerID != UserInfoData.userID
          ? Container(
              color: Colors.transparent,
              height: 90,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        ContactSeller(
                          announceCategorie: widget.categorie!,
                          announceID: widget.announceID!,
                          announceImage: widget.images![0],
                          announcePrice: widget.price!,
                          announceTitle: widget.announceTitle!,
                          recieverAvatar: widget.sellerAvatar!,
                          recieverID: widget.sellerID!,
                          recieverName: widget.sellerName!,
                          recieverPhone: widget.sellerPhone!,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0, right: 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              width: width > 330 ? 160 : 130,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightBlueAccent,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DeliveryAddressScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Buy',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
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
            )
          : null,
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,
        backgroundColor: KbackgroundColor,
        primary: true,
        toolbarHeight: 60,
        title: Center(
          child: Text(
            "Item",
            style: TextStyle(color: Colors.black),
          ),
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                /// *** Carousel SLider *** ///
                Container(
                  width: 400,
                  height: 300,
                  child: Stack(
                    children: [
                      PhotoViewGallery.builder(
                        itemCount: widget.images!.length,
                        builder: (context, index) {
                          return PhotoViewGalleryPageOptions(
                            imageProvider: NetworkImage(
                              widget.images![index],
                            ),
                            initialScale: PhotoViewComputedScale.covered,
                            minScale: PhotoViewComputedScale.contained * 0.8,
                            maxScale: PhotoViewComputedScale.covered * 2,
                          );
                        },
                        scrollPhysics: BouncingScrollPhysics(),
                        loadingBuilder: (context, event) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        onPageChanged: (index) {
                          setState(() {
                            count = index + 1;
                          });
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 80,
                          color: Colors.transparent,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 5,
                            shadowColor: Color.fromRGBO(0, 0, 0, 1),
                            color: Colors.black.withOpacity(0.2),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8, left: 6),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.adjust,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5),
                                  (count == null)
                                      ? Text(
                                          "1",
                                          style: headline26,
                                        )
                                      : Text(
                                          '$count',
                                          style: headline26,
                                        ),
                                  Text("/", style: headline26),
                                  Text("${widget.images!.length}",
                                      style: headline26),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: _productServices
                            .getFavoriteIcon(widget.idAnnounce!),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.yellow,
                                ),
                              );
                            default:
                              if (snapshot.hasError) {
                                return Text('');
                              } else {
                                List<DocumentSnapshot> favorite =
                                    snapshot.data!.docs;
                                if (favorite.length == 0) {
                                  return Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      child: FavoriteButton(
                                        iconDisabledColor: Colors.grey[200],
                                        iconColor: Colors.yellow,
                                        isFavorite: false,
                                        valueChanged: (_isfavorite) async {
                                          _productServices
                                              .createMultimediaFavoriteItem(
                                            widget.idAnnounce,
                                            widget.categorie,
                                            widget.announceTitle,
                                            widget.announceID,
                                            widget.modelNumber,
                                            widget.condition,
                                            widget.genericName,
                                            widget.description,
                                            widget.price,
                                            widget.marque,
                                            widget.model,
                                            widget.governorate,
                                            widget.delegation,
                                            widget.images,
                                            widget.createdAt,
                                            widget.sellerID,
                                            widget.sellerName,
                                            widget.sellerRank,
                                            widget.sellerDate,
                                            widget.sellerAvatar,
                                            widget.sellerPhone,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                } else
                                  return Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      child: FavoriteButton(
                                        iconColor: Colors.yellow,
                                        isFavorite: true,
                                        valueChanged: (_isfavorite) async {
                                          _productServices.deleteFavoriteItem(
                                              widget.idAnnounce);
                                        },
                                      ),
                                    ),
                                  );
                              }
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    child: Column(
                      children: [
                        // *** Item Title + Price *** ///
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                widget.announceTitle!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 110,
                              child: Row(
                                children: [
                                  Text(
                                    widget.price.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  Align(
                                    alignment: Alignment(0.6, -0.80),
                                    child: Text(
                                      "dt",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),

                        /// **** Item Category *** ///
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: 120,
                            height: 30,
                            child: Card(
                              elevation: 0,
                              shadowColor: Colors.grey,
                              color: Colors.yellow,
                              child: Center(
                                child: Text(
                                  widget.categorie!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        // *** Vendor Ranking ** ///
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                              ],
                            ),
                            Text(
                              "(Seller Rate : 5.0)",
                              style: TextStyle(color: Colors.grey),
                            )
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
                SizedBox(height: 12),

                /// ***** Product Details **** ////
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "About This Product",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Model Number",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 15,
                            ),
                          ),
                          Text(widget.modelNumber!),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Generic Name",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 15,
                            ),
                          ),
                          Text(widget.genericName!),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Brand",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 15,
                            ),
                          ),
                          Text(widget.marque!),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Model",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 15,
                            ),
                          ),
                          Text(widget.model!),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Generic Name",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 15,
                            ),
                          ),
                          Text(widget.genericName!),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 8,
                  color: Colors.grey[200],
                ),
                SizedBox(height: 12),

                /// *** Item Description *** ///
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Description",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      ReadMoreText(
                        '${widget.description}',
                        trimLines: 10,
                        trimCollapsedText: 'More',
                        trimExpandedText: 'Less',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Divider(
                  thickness: 8,
                  color: Colors.grey[200],
                ),
                SizedBox(height: 12),

                /// *** Seller Information *** ///

                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "About Seller",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(widget.sellerAvatar!),
                            backgroundColor: Colors.transparent,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.sellerName!.toUpperCase(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          "See Reviews",
                                          style: TextStyle(
                                            color: Colors.black,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.person_outline,
                                    size: 15,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Membre since ${widget.sellerDate}',
                                    style: TextStyle(
                                      color: Color.fromRGBO(114, 114, 114, 1),
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.campaign,
                                    size: 15,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '$announceNumber annonces',
                                    style: TextStyle(
                                      color: Color.fromRGBO(114, 114, 114, 1),
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Divider(
                  thickness: 8,
                  color: Colors.grey[200],
                ),

                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "For You",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              "More",
                              style: TextStyle(color: Color(0xFFBBBBBB)),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_sharp,
                              size: 30,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                AnnounceForUser(
                  iDAnnonce: widget.idAnnounce!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
