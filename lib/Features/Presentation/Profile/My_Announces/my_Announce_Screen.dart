import 'package:bottom_picker/bottom_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Domain/Products/Product_Services.dart';
import 'package:happy_shop/Features/Presentation/Profile/Widgets/my_Announce_Preview.dart';
import 'package:happy_shop/Features/Widgets/Empty_Widget.dart';

class MyAnnounceScreen extends StatefulWidget {
  MyAnnounceScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MyAnnounceScreenState createState() => _MyAnnounceScreenState();
}

class _MyAnnounceScreenState extends State<MyAnnounceScreen> {
  final searchKey = TextEditingController();
  String? _searchTitle;
  String? cat;

  final categorieList = [
    Text("Tous les catégories"),
    Text("Informatique"),
    Text("Motos"),
    Text("Multimédia"),
    Text("Voitures"),
    Text("Autres"),
    Text("Immobilier"),
  ];
  @override
  void initState() {
    super.initState();
  }

  ProductServices _productServices = ProductServices();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: new AppBar(
        bottomOpacity: 0.0,
        title: Row(
          children: [
            SizedBox(width: width > 320 ? 90 : 40),
            Center(
              child: new Text(
                "Compte",
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
        backgroundColor: KbackgroundColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Center(
              child: Text(
                "Mes annonces",
                style: headine20,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Center(
                child: Text(
                  "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur",
                  style: headline7,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Divider(
                thickness: 4,
                color: Colors.grey[300],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 55,
                child: TextFormField(
                  controller: searchKey,
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: 'Rechercher dans toutes les catégories',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      BottomPicker(
                        title: 'Categories',
                        items: categorieList,
                        dismissable: true,
                        onSubmit: (index) {
                          if (index == 0) {
                            setState(() {
                              cat = null;
                            });
                          } else if (index == 1) {
                            setState(() {
                              cat = 'Informatique';
                            });
                          } else if (index == 2) {
                            setState(() {
                              cat = 'Motos';
                            });
                          } else if (index == 3) {
                            setState(() {
                              cat = 'Multimédia';
                            });
                          } else if (index == 4) {
                            setState(() {
                              cat = 'Voitures';
                            });
                          } else if (index == 5) {
                            setState(() {
                              cat = 'Autres';
                            });
                          } else if (index == 6) {
                            setState(() {
                              cat = 'Immobilier';
                            });
                          }
                        },
                      ).show(context);
                    },
                    child: Container(
                      width: 180,
                      height: 50,
                      child: Card(
                        color: Colors.blue[600],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              (cat != null) ? '$cat' : 'Catégories',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 20),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (searchKey.text.isEmpty) {
                        setState(() {
                          _searchTitle = null;
                        });
                      } else {
                        setState(() {
                          _searchTitle = searchKey.text;
                        });
                      }
                    },
                    child: Container(
                      width: 180,
                      height: 50,
                      child: Card(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            'Rechercher',
                            style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: (_searchTitle == null && cat == null)
                  ? _productServices.getUserAnnounces()
                  : (_searchTitle != null && cat == null)
                      ? _productServices.getUserAnnouncesByTitle(_searchTitle!)
                      : (cat != null && _searchTitle == null)
                          ? _productServices.getUserAnnouncesByCategories(cat)
                          : _productServices.getUserAnnounceByCategorieAndTitle(
                              cat, _searchTitle),
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
                                return AnnounceePreviewWidget(
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
                                return AnnounceePreviewWidget(
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
                                return AnnounceePreviewWidget(
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
                                return AnnounceePreviewWidget(
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
                                return AnnounceePreviewWidget(
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
                                return AnnounceePreviewWidget(
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
                                return AnnounceePreviewWidget(
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
