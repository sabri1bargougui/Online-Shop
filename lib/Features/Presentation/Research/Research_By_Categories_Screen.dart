import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:happy_shop/Core/Design/constant.dart';

import 'package:happy_shop/Features/Domain/Search/Search_Services.dart';
import 'package:happy_shop/Features/Presentation/Home/Widgets/Near_You_Widget.dart';
import 'package:happy_shop/Features/Widgets/Empty_Widget.dart';

class ResearchByCategoriesScreen extends StatefulWidget {
  final String categorie;
  ResearchByCategoriesScreen({
    Key? key,
    required this.categorie,
  }) : super(key: key);

  @override
  _ResearchByCategoriesScreenState createState() =>
      _ResearchByCategoriesScreenState();
}

class _ResearchByCategoriesScreenState
    extends State<ResearchByCategoriesScreen> {
  SearchService _searchServices = SearchService();
  final searchKey = TextEditingController();
  String? _searchField;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KbackgroundColor,
        elevation: 0,
        bottomOpacity: 0.0,
        automaticallyImplyLeading: false,

        toolbarHeight: 100, // Set this height
        flexibleSpace: Container(
          color: Colors.yellow,
          child: Column(
            children: [
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Container(
                  height: 40,
                  child: OutlineSearchBar(
                    onClearButtonPressed: (value) {
                      setState(() {
                        _searchField = null;
                      });
                    },
                    onKeywordChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          _searchField = value;
                        });
                      } else if (value.isEmpty) {
                        setState(() {
                          _searchField = null;
                        });
                      }
                    },
                    textEditingController: searchKey,
                    onTypingFinished: (value) {
                      setState(() {
                        _searchField = value;
                      });
                    },
                    borderColor: Colors.white,
                    searchButtonPosition: SearchButtonPosition.leading,
                    searchButtonIconColor: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.grey[400]!,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Card(
                        elevation: 0,
                        color: Colors.grey[200],
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(width: 7),
                              Icon(Icons.location_on),
                              Text(
                                "Autour de moi",
                                style: headline6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      width: 140,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.grey[400]!,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Card(
                        elevation: 0,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text(
                            widget.categorie,
                            style: headline6,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      width: 140,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.grey[400]!,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Card(
                        elevation: 0,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text(
                            'Vue: Galerie',
                            style: headline6,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            StreamBuilder<QuerySnapshot>(
              stream: _searchField == null
                  ? _searchServices.getAnnounceByCategorie(widget.categorie)
                  : _searchServices.getAnnounceBYCategorieAndTitle(
                      _searchField, widget.categorie),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.yellow,
                    ));
                  default:
                    if (snapshot.hasError) {
                      return EmptyWidgetScreen(
                        subtitle: 'probleme',
                        title: 'probleme',
                      );
                    } else {
                      List<DocumentSnapshot> announce = snapshot.data!.docs;
                      if (announce.isEmpty) {
                        return EmptyWidgetScreen(
                            title: 'Aucune annonce trouvée',
                            subtitle: 'Ajouter une annonce');
                      } else
                        return Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: height < 600 ? 0.4 : 0.5,
                              crossAxisSpacing: 2,
                            ),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: announce.length,
                            itemBuilder: (context, index) {
                              if (announce[index]['categorie'] ==
                                  'Informatique') {
                                return NearYouWidget(
                                  idAnnounce: announce[index]['ID_Announce'],
                                  categorie: announce[index]['categorie'],
                                  announceID: announce[index]['announce_ID'],
                                  announceTitle: announce[index]
                                      ['announce_Title'],
                                  createdAt: announce[index]['CreatedAt'],
                                  description: announce[index]['description'],
                                  images: announce[index]['images'],
                                  delegation: announce[index]['delegation'],
                                  governorate: announce[index]['governorate'],
                                  price: announce[index]['announce_Price'],
                                  condition: announce[index]['condition'],
                                  sellerAvatar: announce[index]['Seller']
                                      ['Image_Vendeur'],
                                  sellerDate: announce[index]['Seller']
                                      ['Date_Vendeur'],
                                  sellerID: announce[index]['Seller']
                                      ['Vendeur_ID'],
                                  sellerName: announce[index]['Seller']
                                      ['Nom_Vendeur'],
                                  sellerPhone: announce[index]['Seller']
                                      ['Numéro_Vendeur'],
                                  sellerRank: announce[index]['Seller']
                                      ['Rank_Vendeur'],
                                  consoleType: announce[index]['details']
                                      ['Type_Console'],
                                  garenti: announce[index]['details']
                                      ['Garanti'],
                                  garentiType: announce[index]['details']
                                      ['Type_Garanti'],
                                  genericName: announce[index]['details']
                                      ['Nom_Generique'],
                                  modelNumber: announce[index]['details']
                                      ['Numéro_Modele'],
                                );
                              } else if (announce[index]['categorie'] ==
                                  'Voitures')
                                return NearYouWidget(
                                  idAnnounce: announce[index]['ID_Announce'],
                                  categorie: announce[index]['categorie'],
                                  announceID: announce[index]['announce_ID'],
                                  announceTitle: announce[index]
                                      ['announce_Title'],
                                  createdAt: announce[index]['CreatedAt'],
                                  description: announce[index]['description'],
                                  images: announce[index]['images'],
                                  delegation: announce[index]['delegation'],
                                  governorate: announce[index]['governorate'],
                                  price: announce[index]['announce_Price'],
                                  condition: announce[index]['condition'],
                                  sellerAvatar: announce[index]['Seller']
                                      ['Image_Vendeur'],
                                  sellerDate: announce[index]['Seller']
                                      ['Date_Vendeur'],
                                  sellerID: announce[index]['Seller']
                                      ['Vendeur_ID'],
                                  sellerName: announce[index]['Seller']
                                      ['Nom_Vendeur'],
                                  sellerPhone: announce[index]['Seller']
                                      ['Numéro_Vendeur'],
                                  sellerRank: announce[index]['Seller']
                                      ['Rank_Vendeur'],
                                  carburant: announce[index]['details']
                                      ['carburant'],
                                  color: announce[index]['details']['color'],
                                  model: announce[index]['details']['Model'],
                                  nombrePlaces: announce[index]['details']
                                      ['nbr_places'],
                                  nombrePorte: announce[index]['details']
                                      ['nbr_portes'],
                                  puissanceFiscale: announce[index]['details']
                                      ['puiss_fiscale'],
                                  puissanceDin: announce[index]['details']
                                      ['puiss_din'],
                                  kilometrage: announce[index]['details']
                                      ['kilometrage'],
                                  modelYear: announce[index]['details']
                                      ['annee_modele'],
                                  datemiseencircul: announce[index]['details']
                                      ['date_mise_en_circu'],
                                  typeCar: announce[index]['details']
                                      ['type_vehicule'],
                                  marque: announce[index]['details']['marque'],
                                );
                              else if (announce[index]['categorie'] ==
                                  'Motos') {
                                return NearYouWidget(
                                  idAnnounce: announce[index]['ID_Announce'],
                                  categorie: announce[index]['categorie'],
                                  announceID: announce[index]['announce_ID'],
                                  announceTitle: announce[index]
                                      ['announce_Title'],
                                  createdAt: announce[index]['CreatedAt'],
                                  description: announce[index]['description'],
                                  images: announce[index]['images'],
                                  delegation: announce[index]['delegation'],
                                  governorate: announce[index]['governorate'],
                                  price: announce[index]['announce_Price'],
                                  condition: announce[index]['condition'],
                                  sellerAvatar: announce[index]['Seller']
                                      ['Image_Vendeur'],
                                  sellerDate: announce[index]['Seller']
                                      ['Date_Vendeur'],
                                  sellerID: announce[index]['Seller']
                                      ['Vendeur_ID'],
                                  sellerName: announce[index]['Seller']
                                      ['Nom_Vendeur'],
                                  sellerPhone: announce[index]['Seller']
                                      ['Numéro_Vendeur'],
                                  sellerRank: announce[index]['Seller']
                                      ['Rank_Vendeur'],
                                  color: announce[index]['details']['color'],
                                  model: announce[index]['details']['Model'],
                                  kilometrage: announce[index]['details']
                                      ['kilometrage'],
                                  modelYear: announce[index]['details']
                                      ['annee_modele'],
                                  datemiseencircul: announce[index]['details']
                                      ['date_mise_en_circu'],
                                  typeMotos: announce[index]['details']
                                      ['type_vehicule'],
                                  marque: announce[index]['details']['marque'],
                                );
                              } else if (announce[index]['categorie'] ==
                                  'Multimédia') {
                                return NearYouWidget(
                                  idAnnounce: announce[index]['ID_Announce'],
                                  categorie: announce[index]['categorie'],
                                  announceID: announce[index]['announce_ID'],
                                  announceTitle: announce[index]
                                      ['announce_Title'],
                                  createdAt: announce[index]['CreatedAt'],
                                  description: announce[index]['description'],
                                  images: announce[index]['images'],
                                  delegation: announce[index]['delegation'],
                                  governorate: announce[index]['governorate'],
                                  price: announce[index]['announce_Price'],
                                  condition: announce[index]['condition'],
                                  sellerAvatar: announce[index]['Seller']
                                      ['Image_Vendeur'],
                                  sellerDate: announce[index]['Seller']
                                      ['Date_Vendeur'],
                                  sellerID: announce[index]['Seller']
                                      ['Vendeur_ID'],
                                  sellerName: announce[index]['Seller']
                                      ['Nom_Vendeur'],
                                  sellerPhone: announce[index]['Seller']
                                      ['Numéro_Vendeur'],
                                  sellerRank: announce[index]['Seller']
                                      ['Rank_Vendeur'],
                                  model: announce[index]['details']['Model'],
                                  marque: announce[index]['details']['marque'],
                                  modelNumber: announce[index]['details']
                                      ['Numéro_Modele'],
                                  genericName: announce[index]['details']
                                      ['Nom_Generique'],
                                );
                              } else if (announce[index]['categorie'] ==
                                  'Immobilier') {
                                return NearYouWidget(
                                  idAnnounce: announce[index]['ID_Announce'],
                                  categorie: announce[index]['categorie'],
                                  announceID: announce[index]['announce_ID'],
                                  announceTitle: announce[index]
                                      ['announce_Title'],
                                  createdAt: announce[index]['CreatedAt'],
                                  description: announce[index]['description'],
                                  images: announce[index]['images'],
                                  delegation: announce[index]['delegation'],
                                  governorate: announce[index]['governorate'],
                                  price: announce[index]['announce_Price'],
                                  condition: announce[index]['condition'],
                                  sellerAvatar: announce[index]['Seller']
                                      ['Image_Vendeur'],
                                  sellerDate: announce[index]['Seller']
                                      ['Date_Vendeur'],
                                  sellerID: announce[index]['Seller']
                                      ['Vendeur_ID'],
                                  sellerName: announce[index]['Seller']
                                      ['Nom_Vendeur'],
                                  sellerPhone: announce[index]['Seller']
                                      ['Numéro_Vendeur'],
                                  sellerRank: announce[index]['Seller']
                                      ['Rank_Vendeur'],
                                  surface: announce[index]['details']
                                      ['surface'],
                                  roomNumber: announce[index]['details']
                                      ['nb_Chambre'],
                                  terrain: announce[index]['details']
                                      ['terrain'],
                                );
                              } else if (announce[index]['categorie'] ==
                                  'Autres') {
                                return NearYouWidget(
                                  idAnnounce: announce[index]['ID_Announce'],
                                  categorie: announce[index]['categorie'],
                                  announceID: announce[index]['announce_ID'],
                                  announceTitle: announce[index]
                                      ['announce_Title'],
                                  createdAt: announce[index]['CreatedAt'],
                                  description: announce[index]['description'],
                                  images: announce[index]['images'],
                                  delegation: announce[index]['delegation'],
                                  governorate: announce[index]['governorate'],
                                  price: announce[index]['announce_Price'],
                                  condition: announce[index]['condition'],
                                  sellerAvatar: announce[index]['Seller']
                                      ['Image_Vendeur'],
                                  sellerDate: announce[index]['Seller']
                                      ['Date_Vendeur'],
                                  sellerID: announce[index]['Seller']
                                      ['Vendeur_ID'],
                                  sellerName: announce[index]['Seller']
                                      ['Nom_Vendeur'],
                                  sellerPhone: announce[index]['Seller']
                                      ['Numéro_Vendeur'],
                                  sellerRank: announce[index]['Seller']
                                      ['Rank_Vendeur'],
                                  model: announce[index]['details']['Model'],
                                  marque: announce[index]['details']['marque'],
                                  modelNumber: announce[index]['details']
                                      ['Numéro_Modele'],
                                  genericName: announce[index]['details']
                                      ['Nom_Generique'],
                                );
                              } else if (announce[index]['categorie'] ==
                                  'Immobilier') {
                                return NearYouWidget(
                                  idAnnounce: announce[index]['ID_Announce'],
                                  categorie: announce[index]['categorie'],
                                  announceID: announce[index]['announce_ID'],
                                  announceTitle: announce[index]
                                      ['announce_Title'],
                                  createdAt: announce[index]['CreatedAt'],
                                  description: announce[index]['description'],
                                  images: announce[index]['images'],
                                  delegation: announce[index]['delegation'],
                                  governorate: announce[index]['governorate'],
                                  price: announce[index]['announce_Price'],
                                  condition: announce[index]['condition'],
                                  sellerAvatar: announce[index]['Seller']
                                      ['Image_Vendeur'],
                                  sellerDate: announce[index]['Seller']
                                      ['Date_Vendeur'],
                                  sellerID: announce[index]['Seller']
                                      ['Vendeur_ID'],
                                  sellerName: announce[index]['Seller']
                                      ['Nom_Vendeur'],
                                  sellerPhone: announce[index]['Seller']
                                      ['Numéro_Vendeur'],
                                  sellerRank: announce[index]['Seller']
                                      ['Rank_Vendeur'],
                                );
                              }
                              return Container();
                            },
                          ),
                        );
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
