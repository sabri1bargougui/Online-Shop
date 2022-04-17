import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Domain/Products/Product_Services.dart';
import 'package:happy_shop/Features/Presentation/Product/Autres/Autre_Details_Screen.dart';
import 'package:happy_shop/Features/Presentation/Product/Car/Car_Details_Screen.dart';
import 'package:happy_shop/Features/Presentation/Product/Immobiler/Immobiler_Details_Screen.dart';
import 'package:happy_shop/Features/Presentation/Product/Informatique/Informatique_Details_Screen.dart';
import 'package:happy_shop/Features/Presentation/Product/Motos/Motos_Details_Screen.dart';
import 'package:happy_shop/Features/Presentation/Product/Multimedia/Multimedia_Details_Screen.dart';

class FavoriteWidgetOverView extends StatelessWidget {
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

  final String? consoleType;
  final int? garenti;
  final String? garentiType;
  final String? genericName;
  final String? modelNumber;
  //// Car /////
  final String? carburant;
  final String? color;
  final String? model;
  final int? nombrePorte;
  final int? nombrePlaces;
  final int? puissanceFiscale;
  final int? puissanceDin;
  final double? kilometrage;
  final String? modelYear;
  final String? datemiseencircul;
  final String? typeCar;
  final String? marque;

  //// Immobiler ////
  final String? fournished;
  final int? roomNumber;
  final double? surface;
  final double? terrain;

  /// Motos ///
  final String? typeMotos;
  const FavoriteWidgetOverView({
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
    this.consoleType,
    this.garenti,
    this.garentiType,
    this.genericName,
    this.modelNumber,
    this.carburant,
    this.color,
    this.model,
    this.nombrePorte,
    this.nombrePlaces,
    this.puissanceFiscale,
    this.puissanceDin,
    this.kilometrage,
    this.modelYear,
    this.datemiseencircul,
    this.typeCar,
    this.marque,
    this.fournished,
    this.roomNumber,
    this.surface,
    this.terrain,
    this.typeMotos,
    this.idAnnounce,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductServices _productSevices = ProductServices();
    return InkWell(
      onTap: () {
        if (this.categorie == 'Informatique') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InformatiqueDetailsScreen(
                idAnnounce: this.idAnnounce,
                images: this.images,
                announceID: this.announceID,
                announceTitle: this.announceTitle,
                price: this.price,
                description: this.description,
                consoleType: this.consoleType,
                condition: this.condition,
                categorie: this.categorie,
                createdAt: this.createdAt,
                garenti: this.garenti,
                garentiType: this.garentiType,
                genericName: this.genericName,
                modelNumber: this.modelNumber,
                delegation: this.delegation,
                governorate: this.governorate,
                sellerAvatar: this.sellerAvatar,
                sellerID: this.sellerID,
                sellerDate: this.sellerDate,
                sellerName: this.sellerName,
                sellerPhone: this.sellerPhone,
                sellerRank: this.sellerRank,
              ),
            ),
          );
        } else if (this.categorie == 'Multimédia') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MultiMediaDetailsScreen(
                idAnnounce: this.idAnnounce,
                images: this.images,
                announceID: this.announceID,
                announceTitle: this.announceTitle,
                price: this.price,
                description: this.description,
                condition: this.condition,
                categorie: this.categorie,
                createdAt: this.createdAt,
                genericName: this.genericName,
                modelNumber: this.modelNumber,
                model: this.model,
                marque: this.marque,
                delegation: this.delegation,
                governorate: this.governorate,
                sellerAvatar: this.sellerAvatar,
                sellerID: this.sellerID,
                sellerDate: this.sellerDate,
                sellerName: this.sellerName,
                sellerPhone: this.sellerPhone,
                sellerRank: this.sellerRank,
              ),
            ),
          );
        } else if (this.categorie == 'Motos') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MotosDetailsScreen(
                idAnnounce: this.idAnnounce,
                images: this.images,
                announceID: this.announceID,
                announceTitle: this.announceTitle,
                price: this.price,
                description: this.description,
                condition: this.condition,
                categorie: this.categorie,
                createdAt: this.createdAt,
                color: this.color,
                typeMotos: this.typeMotos,
                kilometrage: this.kilometrage,
                model: this.model,
                marque: this.marque,
                datemiseencircul: this.datemiseencircul,
                modelYear: this.modelYear,
                delegation: this.delegation,
                governorate: this.governorate,
                sellerAvatar: this.sellerAvatar,
                sellerID: this.sellerID,
                sellerDate: this.sellerDate,
                sellerName: this.sellerName,
                sellerPhone: this.sellerPhone,
                sellerRank: this.sellerRank,
              ),
            ),
          );
        } else if (this.categorie == 'Immobilier') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImmmobilierDetailsScreen(
                idAnnounce: this.idAnnounce,
                images: this.images,
                announceID: this.announceID,
                announceTitle: this.announceTitle,
                price: this.price,
                description: this.description,
                condition: this.condition,
                categorie: this.categorie,
                createdAt: this.createdAt,
                roomNumber: this.roomNumber,
                fournished: this.fournished,
                surface: this.surface,
                terrain: this.terrain,
                delegation: this.delegation,
                governorate: this.governorate,
                sellerAvatar: this.sellerAvatar,
                sellerID: this.sellerID,
                sellerDate: this.sellerDate,
                sellerName: this.sellerName,
                sellerPhone: this.sellerPhone,
                sellerRank: this.sellerRank,
              ),
            ),
          );
        } else if (this.categorie == 'Voitures') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CarDetailsScreen(
                idAnnounce: this.idAnnounce,
                images: this.images,
                announceID: this.announceID,
                announceTitle: this.announceTitle,
                price: this.price,
                description: this.description,
                condition: this.condition,
                categorie: this.categorie,
                createdAt: this.createdAt,
                model: this.model,
                color: this.color,
                carburant: this.carburant,
                nombrePlaces: this.nombrePlaces,
                nombrePorte: this.nombrePorte,
                puissanceDin: this.puissanceDin,
                puissanceFiscale: this.puissanceFiscale,
                kilometrage: this.kilometrage,
                modelYear: this.modelYear,
                datemiseencircul: this.datemiseencircul,
                typeCar: this.typeCar,
                marque: this.marque,
                delegation: this.delegation,
                governorate: this.governorate,
                sellerAvatar: this.sellerAvatar,
                sellerID: this.sellerID,
                sellerDate: this.sellerDate,
                sellerName: this.sellerName,
                sellerPhone: this.sellerPhone,
                sellerRank: this.sellerRank,
              ),
            ),
          );
        } else if (this.categorie == 'Autres') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AutresDetailsScreen(
                idAnnounce: this.idAnnounce,
                images: this.images,
                announceID: this.announceID,
                announceTitle: this.announceTitle,
                price: this.price,
                description: this.description,
                condition: this.condition,
                categorie: this.categorie,
                createdAt: this.createdAt,
                delegation: this.delegation,
                governorate: this.governorate,
                sellerAvatar: this.sellerAvatar,
                sellerID: this.sellerID,
                sellerDate: this.sellerDate,
                sellerName: this.sellerName,
                sellerPhone: this.sellerPhone,
                sellerRank: this.sellerRank,
              ),
            ),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 200,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0,
              shadowColor: Colors.grey,
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(images![0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: _productSevices.getFavoriteIcon(this.idAnnounce!),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.black,
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
                                      iconColor: Colors.red,
                                      isFavorite: false,
                                      valueChanged: (_isfavorite) async {
                                        if (this.categorie == 'Motos') {
                                          await _productSevices
                                              .createMotoFavoriteItem(
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
                                            sellerRank,
                                            sellerDate,
                                            sellerAvatar,
                                            sellerPhone,
                                            marque,
                                            kilometrage,
                                            modelYear,
                                            datemiseencircul,
                                            typeMotos,
                                            color,
                                            model,
                                          );
                                        } else if (this.categorie ==
                                            'Informatique') {
                                          _productSevices
                                              .createInformatiqueFavoriteItem(
                                                  idAnnounce,
                                                  categorie,
                                                  condition,
                                                  delegation,
                                                  governorate,
                                                  images,
                                                  announceID,
                                                  announceTitle,
                                                  description,
                                                  sellerID,
                                                  sellerName,
                                                  sellerRank,
                                                  sellerDate,
                                                  sellerAvatar,
                                                  sellerPhone,
                                                  createdAt,
                                                  consoleType,
                                                  garenti,
                                                  garentiType,
                                                  genericName,
                                                  modelNumber,
                                                  price);
                                        } else if (this.categorie ==
                                            'Voitures') {
                                          _productSevices.createCarFavoriteItem(
                                              idAnnounce,
                                              categorie,
                                              condition,
                                              description,
                                              delegation,
                                              governorate,
                                              images,
                                              announceID,
                                              announceTitle,
                                              price,
                                              createdAt,
                                              carburant,
                                              color,
                                              model!,
                                              nombrePorte,
                                              nombrePlaces,
                                              puissanceFiscale,
                                              puissanceDin,
                                              kilometrage,
                                              modelYear,
                                              datemiseencircul,
                                              typeCar,
                                              marque,
                                              sellerID,
                                              sellerName,
                                              sellerRank,
                                              sellerDate,
                                              sellerAvatar,
                                              sellerPhone);
                                        } else if (this.categorie ==
                                            'Multimédia') {
                                          _productSevices
                                              .createMultimediaFavoriteItem(
                                            idAnnounce,
                                            categorie,
                                            announceTitle,
                                            announceID,
                                            modelNumber,
                                            condition,
                                            genericName,
                                            description,
                                            price,
                                            marque,
                                            model,
                                            governorate,
                                            delegation,
                                            images,
                                            createdAt,
                                            sellerID,
                                            sellerName,
                                            sellerRank,
                                            sellerDate,
                                            sellerAvatar,
                                            sellerPhone,
                                          );
                                        } else if (this.categorie ==
                                            'Immobilier') {
                                          _productSevices
                                              .createImmobilerFavoriteItem(
                                                  idAnnounce,
                                                  categorie,
                                                  condition,
                                                  delegation,
                                                  governorate,
                                                  images,
                                                  announceID,
                                                  announceTitle,
                                                  description,
                                                  fournished,
                                                  roomNumber,
                                                  surface,
                                                  terrain,
                                                  price,
                                                  createdAt,
                                                  sellerID,
                                                  sellerName,
                                                  sellerRank,
                                                  sellerDate,
                                                  sellerAvatar,
                                                  sellerPhone);
                                        } else if (this.categorie == 'Autres') {
                                          _productSevices
                                              .createdAutreFavoriteItem(
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
                                                  sellerRank,
                                                  sellerDate,
                                                  sellerAvatar,
                                                  sellerPhone);
                                        }
                                      },
                                    ),
                                  ),
                                );
                              } else
                                return Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    child: FavoriteButton(
                                      iconColor: Colors.red,
                                      isFavorite: true,
                                      valueChanged: (_isfavorite) async {
                                        _productSevices.deleteFavoriteItem(
                                            this.idAnnounce);
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
            ),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 120,
              height: 30,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.redAccent,
                child: Center(
                    child: Text(
                  this.categorie!,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: Text(
                  this.announceTitle!,
                  style: headline19,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.place,
                    color: Color.fromRGBO(196, 196, 196, 1),
                  ),
                  Flexible(
                    child: Text(
                      "${this.delegation},${this.governorate!.replaceAll('Governorate', "")}",
                      style: TextStyle(
                        color: Color.fromRGBO(32, 34, 36, 1),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 4),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 100,
                height: 20,
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        this.price!.round().toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 2),
                    Align(
                      alignment: Alignment.topRight,
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
          ),
        ],
      ),
    );
  }
}
