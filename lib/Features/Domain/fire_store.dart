// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_shop/Features/Data/Models/Announcement/Autre_Model.dart';
import 'package:happy_shop/Features/Data/Models/Announcement/Car_Model.dart';
import 'package:happy_shop/Features/Data/Models/Announcement/Immobilier_Model.dart';
import 'package:happy_shop/Features/Data/Models/Announcement/Infomatique_Model.dart';
import 'package:happy_shop/Features/Data/Models/Announcement/Motos_Model.dart';
import 'package:happy_shop/Features/Data/Models/Announcement/Multimedia_Model.dart';
import 'package:happy_shop/Features/Data/Models/Channel_Model.dart';
import 'package:happy_shop/Features/Data/Models/User_Model.dart';

class FireStoreService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  ///////////// User Collection //////////////
  final CollectionReference _usercollection =
      FirebaseFirestore.instance.collection('users');

  ///////////// Channel Collection //////////////
  final CollectionReference _channelCollection =
      FirebaseFirestore.instance.collection('Channels');

  ///////////// Informatique Collection //////////////
  final CollectionReference _InformatiqueCollection =
      FirebaseFirestore.instance.collection('Informatique');

  ///////////// Voitures  Collection //////////////
  final CollectionReference _CarsCollection =
      FirebaseFirestore.instance.collection('Voitures');

  ///////////// Immobilier Collection //////////////
  final CollectionReference _ImmobilerCollection =
      FirebaseFirestore.instance.collection('Immobilier');

  ///////////// Autres Collection //////////////
  final CollectionReference _AutreCollection =
      FirebaseFirestore.instance.collection('Autres');

  ///////////// Motos Collection //////////////
  final CollectionReference _MotoCollection =
      FirebaseFirestore.instance.collection('Motos');

  ///////////// MultiMedia Collection //////////////
  final CollectionReference _MultiMediaCollection =
      FirebaseFirestore.instance.collection('Multimedia');

  ///////////// User Announces Collection //////////////
  final CollectionReference _UserAnnounceCollection = FirebaseFirestore.instance
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection("Announce");

  ///////////// User Favorite  Collection //////////////
  final CollectionReference _UserFavoriteCollection = FirebaseFirestore.instance
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection("Favorite");

  ///////////// All Announces  Collection //////////////
  final CollectionReference _AllAnnounces =
      FirebaseFirestore.instance.collection('Announces');
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ///////////// Create User  //////////////
  Future createuser(UserModel user) async {
    try {
      await _usercollection.doc(user.uid).set(user.toJson());
    } catch (e) {
      return e;
    }
  }

  ///////////// Create Channel  //////////////
  Future createChannel(ChannelModel channel) async {
    try {
      await _channelCollection.doc(channel.channelID).set(channel.toJson());
    } catch (e) {
      return e;
    }
  }

///////////// Create Informatique Item  //////////////
  Future createInformatiqueItem(InformatiqueModel informatique) async {
    try {
      await _InformatiqueCollection.doc()
          .set(informatique.toJson())
          .whenComplete(
            () => _UserAnnounceCollection.doc().set(
              informatique.toJson(),
            ),
          );
      await _AllAnnounces.doc().set(informatique.toJson());
    } catch (e) {
      return e;
    }
  }

  ///////////// Create Car Item  //////////////
  Future createCarItem(CarModel car) async {
    try {
      await _CarsCollection.doc().set(car.toJson()).whenComplete(
            () => _UserAnnounceCollection.doc().set(
              car.toJson(),
            ),
          );
      await _AllAnnounces.doc().set(car.toJson());
    } catch (e) {
      return e;
    }
  }

///////////// Create Immobilie Item  //////////////
  Future createImmobilerItem(ImmobilerModel immobiler) async {
    try {
      await _ImmobilerCollection.doc().set(immobiler.toJson()).whenComplete(
            () => _UserAnnounceCollection.doc().set(
              immobiler.toJson(),
            ),
          );
      await _AllAnnounces.doc().set(immobiler.toJson());
    } catch (e) {
      return e;
    }
  }

///////////// Create Autres Item  //////////////
  Future createdAutreItem(AutreModel autreModel) async {
    try {
      await _AutreCollection.doc().set(autreModel.toJson()).whenComplete(
            () => _UserAnnounceCollection.doc().set(
              autreModel.toJson(),
            ),
          );
      await _AllAnnounces.doc().set(autreModel.toJson());
    } catch (e) {
      return e;
    }
  }

///////////// Create Motos Item  //////////////
  Future createMotoItem(MotoModel motoModel) async {
    try {
      await _MotoCollection.doc().set(motoModel.toJson()).whenComplete(
            () => _UserAnnounceCollection.doc().set(
              motoModel.toJson(),
            ),
          );
      await _AllAnnounces.doc().set(motoModel.toJson());
    } catch (e) {
      return e;
    }
  }

///////////// Create MultiMedia Item  //////////////
  Future createdMultimediaItem(MultiMediaModel multimediaModel) async {
    try {
      await _MultiMediaCollection.doc()
          .set(multimediaModel.toJson())
          .whenComplete(
            () => _UserAnnounceCollection.doc().set(
              multimediaModel.toJson(),
            ),
          );
      await _AllAnnounces.doc().set(multimediaModel.toJson());
    } catch (e) {
      return e;
    }
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////  Favorite   ///////////

///////////// Create Favorite Informatique Item  //////////////
  Future createInformatiqueFavoriteItem(InformatiqueModel informatique) async {
    try {
      await _UserFavoriteCollection.doc(informatique.idAnnounce)
          .set(informatique.toJson());
    } catch (e) {
      return e;
    }
  }

///////////// Create Favorite Car Item  //////////////
  Future createCarFavoriteItem(CarModel car) async {
    try {
      await _UserFavoriteCollection.doc(car.idAnnounce).set(car.toJson());
    } catch (e) {
      return e;
    }
  }

///////////// Create Favorite Imobilier Item  //////////////
  Future createImmobilerFavoriteItem(ImmobilerModel immobiler) async {
    try {
      await _UserFavoriteCollection.doc(immobiler.idAnnounce)
          .set(immobiler.toJson());
    } catch (e) {
      return e;
    }
  }

///////////// Create Favorite Autres Item  //////////////
  Future createdAutreFavoriteItem(AutreModel autreModel) async {
    try {
      await _UserFavoriteCollection.doc(autreModel.idAnnounce)
          .set(autreModel.toJson());
    } catch (e) {
      return e;
    }
  }

///////////// Create Favorite Motos Item  //////////////
  Future createMotoFavoriteItem(MotoModel motoModel) async {
    try {
      await _UserFavoriteCollection.doc(motoModel.idAnnounce)
          .set(motoModel.toJson());
    } catch (e) {
      return e;
    }
  }

///////////// Create Favorite MultiMedia Item  //////////////
  Future createdMultimediaFavoriteItem(MultiMediaModel multimediaModel) async {
    try {
      await _UserFavoriteCollection.doc(multimediaModel.idAnnounce)
          .set(multimediaModel.toJson());
    } catch (e) {
      return e;
    }
  }
}
