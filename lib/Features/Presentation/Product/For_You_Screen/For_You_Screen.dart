import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:happy_shop/Features/Domain/Products/Product_Services.dart';
import 'package:happy_shop/Features/Presentation/Product/Widget/For_You_OverView_Screen.dart';
import 'package:happy_shop/Features/Widgets/Empty_Widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AnnounceForUser extends StatelessWidget {
  const AnnounceForUser({
    Key? key,
    required this.iDAnnonce,
  }) : super(key: key);

  final String iDAnnonce;

  @override
  Widget build(BuildContext context) {
    ProductServices _productServices = ProductServices();
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _productServices.getAnnouncesForUser(iDAnnonce),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularStepProgressIndicator(
                        totalSteps: 20,
                        currentStep: 6,
                        selectedColor: Colors.cyan,
                        unselectedColor: Colors.yellowAccent,
                        selectedStepSize: 3.0,
                        unselectedStepSize: 9.0,
                        width: 100,
                      ),
                    );
                  default:
                    if (snapshot.hasError) {
                      return Container(
                        height: 100,
                        width: 100,
                        child: EmptyWidgetScreen(
                          subtitle: 'probleme',
                          title: 'probleme',
                          fontsizetitle: 10,
                          fontsizeSubTitle: 5,
                        ),
                      );
                    } else {
                      List<DocumentSnapshot> announce = snapshot.data!.docs;
                      if (announce.isEmpty) {
                        return Container(
                          height: 100,
                          width: 100,
                          child: EmptyWidgetScreen(
                            title: 'Aucune annonce trouvée',
                            subtitle: 'Ajouter une annonce',
                            fontsizetitle: 10,
                            fontsizeSubTitle: 5,
                          ),
                        );
                      } else
                        return SizedBox(
                          height: 200,
                          width: width,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              primary: false,
                              itemCount: announce.length,
                              itemBuilder: (context, index) {
                                if (announce[index]['categorie'] ==
                                    'Informatique') {
                                  return ForYouOverViewScreen(
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
                                  return ForYouOverViewScreen(
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
                                    marque: announce[index]['details']
                                        ['marque'],
                                  );
                                else if (announce[index]['categorie'] ==
                                    'Motos') {
                                  return ForYouOverViewScreen(
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
                                    marque: announce[index]['details']
                                        ['marque'],
                                  );
                                } else if (announce[index]['categorie'] ==
                                    'Multimédia') {
                                  return ForYouOverViewScreen(
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
                                    marque: announce[index]['details']
                                        ['marque'],
                                    modelNumber: announce[index]['details']
                                        ['Numéro_Modele'],
                                    genericName: announce[index]['details']
                                        ['Nom_Generique'],
                                  );
                                } else if (announce[index]['categorie'] ==
                                    'Immobilier') {
                                  return ForYouOverViewScreen(
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
                                  return ForYouOverViewScreen(
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
                                    marque: announce[index]['details']
                                        ['marque'],
                                    modelNumber: announce[index]['details']
                                        ['Numéro_Modele'],
                                    genericName: announce[index]['details']
                                        ['Nom_Generique'],
                                  );
                                } else if (announce[index]['categorie'] ==
                                    'Immobilier') {
                                  return ForYouOverViewScreen(
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
