import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_shop/Core/Shared/user_info.dart';
import 'package:happy_shop/Features/Data/Models/User_Model.dart';
import 'package:happy_shop/Features/Domain/fire_store.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FireStoreService _fireStoreService = FireStoreService();

  Future signup(
    String email,
    String name,
    String lastname,
    int phonenumber,
    String avatarurl,
    String createdAt,
  ) async {
    try {
      User? user = _auth.currentUser;

      _fireStoreService.createuser(
        UserModel(
          uid: user!.uid,
          email: email,
          name: name,
          lastname: lastname,
          avatarurl: avatarurl,
          phonenumber: phonenumber,
          createdAT: createdAt,
        ),
      );

      return user;
    } catch (e) {
      throw e;
    }
  }

  Future updateUserPhoto(
    String? urlImage,
  ) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(UserInfoData.userID)
        .update({
      'avatarurl': urlImage,
    });
  }

  Stream<DocumentSnapshot> getUserInfo() => FirebaseFirestore.instance
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .snapshots();
}
