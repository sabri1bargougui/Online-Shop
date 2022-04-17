import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_shop/Features/Data/Models/Announcement/Autre_Model.dart';
import 'package:happy_shop/Features/Data/Models/Announcement/Car_Model.dart';
import 'package:happy_shop/Features/Data/Models/Announcement/Immobilier_Model.dart';
import 'package:happy_shop/Features/Data/Models/Announcement/Infomatique_Model.dart';
import 'package:happy_shop/Features/Data/Models/Announcement/Motos_Model.dart';
import 'package:happy_shop/Features/Data/Models/Announcement/Multimedia_Model.dart';
import 'package:happy_shop/Features/Domain/fire_store.dart';

class ProductServices {
  FireStoreService _fireStoreService = FireStoreService();
  static FirebaseAuth _auth = FirebaseAuth.instance;

  /// **** Create Informatique Item  ***///
  Future createInformatiqueItem(
    String? idAnnounce,
    String? categorie,
    String? condition,
    String? delegation,
    String? governorate,
    List<String>? images,
    String? announceID,
    String? announceTitle,
    String? description,
    String? sellerID,
    String? sellerName,
    String? sellerLastName,
    double? sellerRank,
    String? sellerDate,
    String? sellerAvatar,
    int? sellerPhone,
    String? createdAt,
    String? consoleType,
    int? garenti,
    String? garentiType,
    String? genericName,
    String? modelNumber,
    double? price,
    double longitude,
    double latitude,
    List? keywords,
  ) async {
    try {
      await _fireStoreService.createInformatiqueItem(
        InformatiqueModel(
          announceID: announceID,
          announceTitle: announceTitle,
          price: price,
          categorie: categorie,
          condition: condition,
          createdAt: createdAt,
          delegation: delegation,
          governorate: governorate,
          description: description,
          details: {
            'Type_Console': consoleType,
            'Garanti': garenti,
            'Type_Garanti': garentiType,
            'Nom_Generique': genericName,
            'Numéro_Modele': modelNumber,
          },
          images: images,
          seller: {
            'Nom_Vendeur': '$sellerName $sellerLastName',
            'Rank_Vendeur': sellerRank,
            'Date_Vendeur': sellerDate,
            'Numéro_Vendeur': sellerPhone,
            'Image_Vendeur': sellerAvatar,
            'Vendeur_ID': sellerID,
          },
          location: GeoPoint(latitude, longitude),
          idAnnounce: idAnnounce,
          keyWord: keywords,
        ),
      );
    } catch (e) {}
  }

  /// **** Create car Item  ***///

  Future createCarItem(
    String? idAnnounce,
    String? categorie,
    String? condition,
    String? description,
    String? delegation,
    String? governorate,
    List<String>? images,
    String? announceID,
    String? announceTitle,
    double? price,
    String? createdAt,
    String? carburant,
    String? color,
    String model,
    int? nombrePorte,
    int? nombrePlaces,
    int? puissanceFiscale,
    int? puissanceDin,
    double? kilometrage,
    String? modelYear,
    String? datemiseencircul,
    String? typeCar,
    String? marque,
    String? sellerID,
    String? sellerName,
    String? sellerLastName,
    double? sellerRank,
    String? sellerDate,
    String? sellerAvatar,
    int? sellerPhone,
    double longitude,
    double latitude,
    List? keywords,
  ) async {
    try {
      await _fireStoreService.createCarItem(
        CarModel(
          announceID: announceID,
          announceTitle: announceTitle,
          price: price,
          categorie: categorie,
          condition: condition,
          delegation: delegation,
          description: description,
          details: {
            'annee_modele': modelYear,
            'carburant': carburant,
            'color': color,
            'date_mise_en_circu': datemiseencircul,
            'kilometrage': kilometrage,
            'marque': marque,
            'Model': model,
            'nbr_places': nombrePlaces,
            'nbr_portes': nombrePorte,
            'puiss_din': puissanceDin,
            'puiss_fiscale': puissanceFiscale,
            'type_vehicule': typeCar,
          },
          governorate: governorate,
          images: images,
          seller: {
            'Nom_Vendeur': '$sellerName $sellerLastName',
            'Rank_Vendeur': sellerRank,
            'Date_Vendeur': sellerDate,
            'Numéro_Vendeur': sellerPhone,
            'Image_Vendeur': sellerAvatar,
            'Vendeur_ID': sellerID,
          },
          createdAt: createdAt,
          location: GeoPoint(latitude, longitude),
          idAnnounce: idAnnounce,
          keyWord: keywords,
        ),
      );
    } catch (e) {}
  }

  /// **** Create Immobilier Item  ***///
  Future createImmobilerItem(
    String? idAnnounce,
    String? categorie,
    String? condition,
    String? delegation,
    String? governorate,
    List<String>? images,
    String? announceID,
    String? announceTitle,
    String? description,
    String? fournished,
    int? roomNumber,
    double? surface,
    double? terrain,
    double? price,
    String? createdAt,
    String? sellerID,
    String? sellerName,
    String? sellerLastName,
    double? sellerRank,
    String? sellerDate,
    String? sellerAvatar,
    int? sellerPhone,
    double longitude,
    double latitude,
    List? keywords,
  ) async {
    try {
      await _fireStoreService.createImmobilerItem(
        ImmobilerModel(
          announceID: announceID,
          announceTitle: announceTitle,
          categorie: categorie,
          condition: condition,
          delegation: delegation,
          description: description,
          details: {
            'nb_Chambre': roomNumber,
            'surface': surface,
            'terrain': terrain,
          },
          governorate: governorate,
          images: images,
          price: price,
          seller: {
            'Nom_Vendeur': '$sellerName $sellerLastName',
            'Rank_Vendeur': sellerRank,
            'Date_Vendeur': sellerDate,
            'Numéro_Vendeur': sellerPhone,
            'Image_Vendeur': sellerAvatar,
            'Vendeur_ID': sellerID,
          },
          createdAt: createdAt,
          location: GeoPoint(latitude, longitude),
          idAnnounce: idAnnounce,
          keyWord: keywords,
        ),
      );
    } catch (e) {}
  }

  /// **** Create Autre Item  ***///
  Future createdAutreItem(
    String? idAnnounce,
    String? categorie,
    String? condition,
    String? delegation,
    String? governorate,
    double? price,
    List<String>? images,
    String? announceID,
    String? announceTitle,
    String? description,
    String? createdAt,
    String? sellerID,
    String? sellerName,
    String? sellerLastName,
    double? sellerRank,
    String? sellerDate,
    String? sellerAvatar,
    int? sellerPhone,
    double longitude,
    double latitude,
    List? keywords,
  ) async {
    try {
      await _fireStoreService.createdAutreItem(
        AutreModel(
          announceID: announceID,
          announceTitle: announceTitle,
          categorie: categorie,
          condition: condition,
          delegation: delegation,
          description: description,
          governorate: governorate,
          images: images,
          price: price,
          seller: {
            'Nom_Vendeur': '$sellerName $sellerLastName',
            'Rank_Vendeur': sellerRank,
            'Date_Vendeur': sellerDate,
            'Numéro_Vendeur': sellerPhone,
            'Image_Vendeur': sellerAvatar,
            'Vendeur_ID': sellerID,
          },
          createdAt: createdAt,
          location: GeoPoint(latitude, longitude),
          idAnnounce: idAnnounce,
          keyWord: keywords,
        ),
      );
    } catch (e) {}
  }

  /// **** Create Motos Item  ***///
  Future createMotoItem(
    String? idAnnounce,
    String? categorie,
    String? condition,
    String? delegation,
    String? governorate,
    double? price,
    List<String>? images,
    String? announceID,
    String? announceTitle,
    String? description,
    String? createdAt,
    String? sellerID,
    String? sellerName,
    String? sellerLastName,
    double? sellerRank,
    String? sellerDate,
    String? sellerAvatar,
    int? sellerPhone,
    String? marque,
    double? kilometrage,
    String? modelYear,
    String? datemiseencircul,
    String? typeMotos,
    String? color,
    String? model,
    double longitude,
    double latitude,
    List? keywords,
  ) async {
    try {
      await _fireStoreService.createMotoItem(
        MotoModel(
          announceID: announceID,
          announceTitle: announceTitle,
          categorie: categorie,
          condition: condition,
          delegation: delegation,
          description: description,
          details: {
            'annee_modele': modelYear,
            'color': color,
            'date_mise_en_circu': datemiseencircul,
            'kilometrage': kilometrage,
            'marque': marque,
            'type_vehicule': typeMotos,
            'Model': model,
          },
          governorate: governorate,
          images: images,
          price: price,
          seller: {
            'Nom_Vendeur': '$sellerName $sellerLastName',
            'Rank_Vendeur': sellerRank,
            'Date_Vendeur': sellerDate,
            'Numéro_Vendeur': sellerPhone,
            'Image_Vendeur': sellerAvatar,
            'Vendeur_ID': sellerID,
          },
          createdAt: createdAt,
          location: GeoPoint(latitude, longitude),
          idAnnounce: idAnnounce,
          keyWord: keywords,
        ),
      );
    } catch (e) {}
  }

  /// **** Create MultiMedia Item  ***///
  Future createMultimediaItem(
    String? idAnnounce,
    String? categorie,
    String? announcementTitle,
    String? announceID,
    String? modelNumber,
    String? condition,
    String? genericName,
    String? description,
    double? price,
    String? marque,
    String? model,
    String? gouvernorate,
    String? delegation,
    List<String>? images,
    String? createdAt,
    String? sellerID,
    String? sellerName,
    String? sellerLastName,
    double? sellerRank,
    String? sellerDate,
    String? sellerAvatar,
    int? sellerPhone,
    double longitude,
    double latitude,
    List? keywords,
  ) async {
    try {
      await _fireStoreService.createdMultimediaItem(
        MultiMediaModel(
          announceID: announceID,
          announceTitle: announcementTitle,
          categorie: categorie,
          condition: condition,
          delegation: delegation,
          description: description,
          details: {
            'Nom_Generique': genericName,
            'marque': marque,
            'Model': model,
            'Numéro_Modele': modelNumber,
          },
          governorate: gouvernorate,
          images: images,
          price: price,
          seller: {
            'Nom_Vendeur': '$sellerName $sellerLastName',
            'Rank_Vendeur': sellerRank,
            'Date_Vendeur': sellerDate,
            'Numéro_Vendeur': sellerPhone,
            'Image_Vendeur': sellerAvatar,
            'Vendeur_ID': sellerID,
          },
          createdAt: createdAt,
          location: GeoPoint(latitude, longitude),
          idAnnounce: idAnnounce,
          keyWord: keywords,
        ),
      );
    } catch (e) {}
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //// Get User announces ////
  Stream<QuerySnapshot> getUserAnnounces() => FirebaseFirestore.instance
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('Announce')
      .orderBy('CreatedAt', descending: true)
      .snapshots();

  Stream<QuerySnapshot> getAnnounceByTitle(
    String? title,
  ) =>
      FirebaseFirestore.instance
          .collection('Announces')
          .where('announce_Title', isGreaterThanOrEqualTo: title)
          .snapshots();

  /////  Search inisde User Announces /////
  Stream<QuerySnapshot> getUserAnnouncesByTitle(
    String? itemTitle,
  ) =>
      FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('Announce')
          .where(
            'SearchKey',
            arrayContains: itemTitle,
          )
          .snapshots();

  Stream<QuerySnapshot> getUserAnnounceByCategorieAndTitle(
    String? cat,
    String? itemTitle,
  ) =>
      FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('Announce')
          .where('categorie', isEqualTo: cat)
          .where('SearchKey', arrayContains: itemTitle)
          .snapshots();
  Stream<QuerySnapshot> getUserAnnouncesByCategories(
    String? cat,
  ) =>
      FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('Announce')
          .where(
            'categorie',
            isEqualTo: cat,
          )
          .snapshots();

  /// Get New Announcement : in home  screen ///
  Stream<QuerySnapshot> getNewAnnounces() => FirebaseFirestore.instance
      .collection('Announces')
      .orderBy('CreatedAt', descending: true)
      .snapshots();

  //// get for You Announces ///
  Stream<QuerySnapshot> getAnnouncesForUser(
    String? idAnnnounce,
  ) =>
      FirebaseFirestore.instance
          .collection('Announces')
          .where('ID_Announce', isNotEqualTo: idAnnnounce)
          .snapshots();

  ///get announce by categorie ////
  Stream<QuerySnapshot> getAnnouncesByCategorie(
    String categorie,
  ) =>
      FirebaseFirestore.instance
          .collection('Announces')
          .where('categorie', isEqualTo: categorie)
          .snapshots();

  //// GEt Announce Near User  /////
  Stream<QuerySnapshot> getAnnouncesNearUser(
    String location,
  ) =>
      FirebaseFirestore.instance
          .collection('Announces')
          .where('governorate', isEqualTo: '$location ')
          .snapshots();

  /// Search Announc By Title ///
  /* Stream<QuerySnapshot> getAnnounceByTitle(
    String title,
  ) =>
      FirebaseFirestore.instance
          .collection('Announces')
          .where('governorate', isGreaterThanOrEqualTo: '$title ')
          .snapshots();*/

  /// get number of announces of the user ////

  Future getCount({String? sellerid}) async => FirebaseFirestore.instance
          .collection('Announces')
          .where('announce_ID', isEqualTo: sellerid)
          .get()
          .then((value) {
        var count = 0;
        count = value.docs.length;

        return count;
      });

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /// **** Create Informatique  Favorite Item  ***///
  Future createInformatiqueFavoriteItem(
    String? idAnnounce,
    String? categorie,
    String? condition,
    String? delegation,
    String? governorate,
    List? images,
    String? announceID,
    String? announceTitle,
    String? description,
    String? sellerID,
    String? sellerName,
    double? sellerRank,
    String? sellerDate,
    String? sellerAvatar,
    int? sellerPhone,
    String? createdAt,
    String? consoleType,
    int? garenti,
    String? garentiType,
    String? genericName,
    String? modelNumber,
    double? price,
  ) async {
    try {
      await _fireStoreService.createInformatiqueFavoriteItem(
        InformatiqueModel(
          announceID: announceID,
          announceTitle: announceTitle,
          price: price,
          categorie: categorie,
          condition: condition,
          createdAt: createdAt,
          delegation: delegation,
          governorate: governorate,
          description: description,
          details: {
            'Type_Console': consoleType,
            'Garanti': garenti,
            'Type_Garanti': garentiType,
            'Nom_Generique': genericName,
            'Numéro_Modele': modelNumber,
          },
          images: images,
          seller: {
            'Nom_Vendeur': '$sellerName',
            'Rank_Vendeur': sellerRank,
            'Date_Vendeur': sellerDate,
            'Numéro_Vendeur': sellerPhone,
            'Image_Vendeur': sellerAvatar,
            'Vendeur_ID': sellerID,
          },
          idAnnounce: idAnnounce,
        ),
      );
    } catch (e) {}
  }

  /// **** Create Car  Favorite Item  ***///
  Future createCarFavoriteItem(
    String? idAnnounce,
    String? categorie,
    String? condition,
    String? description,
    String? delegation,
    String? governorate,
    List? images,
    String? announceID,
    String? announceTitle,
    double? price,
    String? createdAt,
    String? carburant,
    String? color,
    String model,
    int? nombrePorte,
    int? nombrePlaces,
    int? puissanceFiscale,
    int? puissanceDin,
    double? kilometrage,
    String? modelYear,
    String? datemiseencircul,
    String? typeCar,
    String? marque,
    String? sellerID,
    String? sellerName,
    double? sellerRank,
    String? sellerDate,
    String? sellerAvatar,
    int? sellerPhone,
  ) async {
    try {
      await _fireStoreService.createCarFavoriteItem(
        CarModel(
          announceID: announceID,
          announceTitle: announceTitle,
          price: price,
          categorie: categorie,
          condition: condition,
          delegation: delegation,
          description: description,
          details: {
            'annee_modele': modelYear,
            'carburant': carburant,
            'color': color,
            'date_mise_en_circu': datemiseencircul,
            'kilometrage': kilometrage,
            'marque': marque,
            'Model': model,
            'nbr_places': nombrePlaces,
            'nbr_portes': nombrePorte,
            'puiss_din': puissanceDin,
            'puiss_fiscale': puissanceFiscale,
            'type_vehicule': typeCar,
          },
          governorate: governorate,
          images: images,
          seller: {
            'Nom_Vendeur': '$sellerName',
            'Rank_Vendeur': sellerRank,
            'Date_Vendeur': sellerDate,
            'Numéro_Vendeur': sellerPhone,
            'Image_Vendeur': sellerAvatar,
            'Vendeur_ID': sellerID,
          },
          createdAt: createdAt,
          idAnnounce: idAnnounce,
        ),
      );
    } catch (e) {}
  }

  /// **** Create Immobilier  Favorite Item  ***///
  Future createImmobilerFavoriteItem(
    String? idAnnounce,
    String? categorie,
    String? condition,
    String? delegation,
    String? governorate,
    List? images,
    String? announceID,
    String? announceTitle,
    String? description,
    String? fournished,
    int? roomNumber,
    double? surface,
    double? terrain,
    double? price,
    String? createdAt,
    String? sellerID,
    String? sellerName,
    double? sellerRank,
    String? sellerDate,
    String? sellerAvatar,
    int? sellerPhone,
  ) async {
    try {
      await _fireStoreService.createImmobilerFavoriteItem(
        ImmobilerModel(
          announceID: announceID,
          announceTitle: announceTitle,
          categorie: categorie,
          condition: condition,
          delegation: delegation,
          description: description,
          details: {
            'nb_Chambre': roomNumber,
            'surface': surface,
            'terrain': terrain,
          },
          governorate: governorate,
          images: images,
          price: price,
          seller: {
            'Nom_Vendeur': '$sellerName',
            'Rank_Vendeur': sellerRank,
            'Date_Vendeur': sellerDate,
            'Numéro_Vendeur': sellerPhone,
            'Image_Vendeur': sellerAvatar,
            'Vendeur_ID': sellerID,
          },
          createdAt: createdAt,
          idAnnounce: idAnnounce,
        ),
      );
    } catch (e) {}
  }

  Future createdAutreFavoriteItem(
    String? idAnnounce,
    String? categorie,
    String? condition,
    String? delegation,
    String? governorate,
    double? price,
    List? images,
    String? announceID,
    String? announceTitle,
    String? description,
    String? createdAt,
    String? sellerID,
    String? sellerName,
    double? sellerRank,
    String? sellerDate,
    String? sellerAvatar,
    int? sellerPhone,
  ) async {
    try {
      await _fireStoreService.createdAutreFavoriteItem(
        AutreModel(
          announceID: announceID,
          announceTitle: announceTitle,
          categorie: categorie,
          condition: condition,
          delegation: delegation,
          description: description,
          governorate: governorate,
          images: images,
          price: price,
          seller: {
            'Nom_Vendeur': '$sellerName',
            'Rank_Vendeur': sellerRank,
            'Date_Vendeur': sellerDate,
            'Numéro_Vendeur': sellerPhone,
            'Image_Vendeur': sellerAvatar,
            'Vendeur_ID': sellerID,
          },
          createdAt: createdAt,
          idAnnounce: idAnnounce,
        ),
      );
    } catch (e) {}
  }

  /// **** Create Motos  Favorite Item  ***///
  Future createMotoFavoriteItem(
    String? idAnnounce,
    String? categorie,
    String? condition,
    String? delegation,
    String? governorate,
    double? price,
    List? images,
    String? announceID,
    String? announceTitle,
    String? description,
    String? createdAt,
    String? sellerID,
    String? sellerName,
    double? sellerRank,
    String? sellerDate,
    String? sellerAvatar,
    int? sellerPhone,
    String? marque,
    double? kilometrage,
    String? modelYear,
    String? datemiseencircul,
    String? typeMotos,
    String? color,
    String? model,
  ) async {
    try {
      await _fireStoreService.createMotoFavoriteItem(
        MotoModel(
          announceID: announceID,
          announceTitle: announceTitle,
          categorie: categorie,
          condition: condition,
          delegation: delegation,
          description: description,
          details: {
            'annee_modele': modelYear,
            'color': color,
            'date_mise_en_circu': datemiseencircul,
            'kilometrage': kilometrage,
            'marque': marque,
            'type_vehicule': typeMotos,
            'Model': model,
          },
          governorate: governorate,
          images: images,
          price: price,
          seller: {
            'Nom_Vendeur': '$sellerName',
            'Rank_Vendeur': sellerRank,
            'Date_Vendeur': sellerDate,
            'Numéro_Vendeur': sellerPhone,
            'Image_Vendeur': sellerAvatar,
            'Vendeur_ID': sellerID,
          },
          createdAt: createdAt,
          idAnnounce: idAnnounce,
        ),
      );
    } catch (e) {}
  }

  /// **** Create MultiMedia  Favorite Item  ***///
  Future createMultimediaFavoriteItem(
    String? idAnnounce,
    String? categorie,
    String? announcementTitle,
    String? announceID,
    String? modelNumber,
    String? condition,
    String? genericName,
    String? description,
    double? price,
    String? marque,
    String? model,
    String? gouvernorate,
    String? delegation,
    List? images,
    String? createdAt,
    String? sellerID,
    String? sellerName,
    double? sellerRank,
    String? sellerDate,
    String? sellerAvatar,
    int? sellerPhone,
  ) async {
    try {
      await _fireStoreService.createdMultimediaFavoriteItem(
        MultiMediaModel(
          announceID: announceID,
          announceTitle: announcementTitle,
          categorie: categorie,
          condition: condition,
          delegation: delegation,
          description: description,
          details: {
            'Nom_Generique': genericName,
            'marque': marque,
            'Model': model,
            'Numéro_Modele': modelNumber,
          },
          governorate: gouvernorate,
          images: images,
          price: price,
          seller: {
            'Nom_Vendeur': '$sellerName',
            'Rank_Vendeur': sellerRank,
            'Date_Vendeur': sellerDate,
            'Numéro_Vendeur': sellerPhone,
            'Image_Vendeur': sellerAvatar,
            'Vendeur_ID': sellerID,
          },
          createdAt: createdAt,
          idAnnounce: idAnnounce,
        ),
      );
    } catch (e) {}
  }

  //////// Get Favorite Icon : if true : yellow else if false : grey ///////////
  Stream<QuerySnapshot> getFavoriteIcon(
    String idAnnonce,
  ) =>
      FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('Favorite')
          .where('ID_Announce', isEqualTo: idAnnonce)
          .snapshots();

  /////////  Get All User Favorite /////////////
  Stream<QuerySnapshot> getFavoriteItem() => FirebaseFirestore.instance
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('Favorite')
      .snapshots();

  ////////// Delete favorite Item ////////////
  void deleteFavoriteItem(
    String? idAnnounce,
  ) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('Favorite')
        .doc(idAnnounce)
        .delete();
  }
}
