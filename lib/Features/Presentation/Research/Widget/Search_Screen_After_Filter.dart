import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Domain/Search/Search_Services.dart';
import 'package:happy_shop/Features/Presentation/Home/Widgets/Near_You_Widget.dart';
import 'package:happy_shop/Features/Widgets/Empty_Widget.dart';

class SearchScreenAfterFilter extends StatelessWidget {
  final String? cat;
  final String? condition;
  final double minPrice;
  final double maxPrice;
  final String? city;
  const SearchScreenAfterFilter(
      {Key? key,
      this.cat,
      this.condition,
      required this.minPrice,
      required this.maxPrice,
      this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SearchService _searchServices = SearchService();
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
            SizedBox(height: 20),
            StreamBuilder<QuerySnapshot>(
              stream: _searchServices.getAnnounceByAllCondition(this.minPrice,
                  this.cat, this.city, this.condition, this.maxPrice),
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
