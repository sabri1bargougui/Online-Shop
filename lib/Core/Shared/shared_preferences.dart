import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferncesService {
  final CollectionReference _usercollection =
      FirebaseFirestore.instance.collection('users');

  Future saveUserData(String userID) async {
    _usercollection.doc(userID).get().then((snapshots) {
      if (snapshots.exists) {
        Map<String, dynamic> data = snapshots.data() as Map<String, dynamic>;
        saveUserName(data['name']);
        saveUserLastname(data['lastname']);
        saveUserEmail(data['email']);
        saveUserID(data['uid']);
        saveUserImage(data['avatarurl']);
        saveuserPhoneNUMBER(data['phonenumber']);
        saveuserDate(data['createdAT']);
      }
    });
  }

  /// shared prefernses ///

  static String userEmailKey = "Email";
  static String userNameKey = "Name";
  static String userLastNameKey = "LastName";
  static String userImageUrL = "ImageUrl";
  static String userId = "UserID";
  static String userphoneNumber = "PhoneNumber";
  static String createdAT = "CreatedAt";
  static String location = "Location";

  /// saving data to sharedpreference
  static Future<bool> saveUserEmail(String userEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userEmailKey, userEmail);
  }

  static Future<bool> saveUserName(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userNameKey, userName);
  }

  static Future<bool> saveUserLastname(String userLastName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userLastNameKey, userLastName);
  }

  static Future<bool> saveUserImage(String userImageUrl) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userImageUrL, userImageUrl);
  }

  static Future<bool> saveUserID(String userID) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userId, userID);
  }

  static Future<bool> saveuserPhoneNUMBER(int phoneNumber) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setInt(userphoneNumber, phoneNumber);
  }

  static Future<bool> saveuserDate(String userDate) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(createdAT, userDate);
  }

  static Future<bool> saveUserLocation(String location) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(location, location);
  }

  // get shared data ///
  static Future<String?> getuserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userNameKey);
  }

  static Future<String?> getuserLastName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userLastNameKey);
  }

  static Future<String?> getuserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userEmailKey);
  }

  static Future<String?> getuserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userId);
  }

  static Future<String?> getUserImage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userImageUrL);
  }

  static Future<int?> getuserPhone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(userphoneNumber);
  }

  static Future<String?> getUserDate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(createdAT);
  }

  static Future<String?> getUserLocation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(location);
  }
}
