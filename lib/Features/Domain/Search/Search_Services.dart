import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  Stream<QuerySnapshot> getAnnounceByPrice(
    double? minPrice,
    double? maxPrice,
  ) =>
      FirebaseFirestore.instance
          .collection('Announces')
          .where('announce_Price', isGreaterThan: minPrice)
          .where('announce_Price', isLessThan: maxPrice)
          .snapshots();
  Stream<QuerySnapshot> getAnnounceByAllCondition(
    double? minPrice,
    String? cat,
    String? city,
    String? condition,
    double? maxPrice,
  ) =>
      FirebaseFirestore.instance
          .collection('Announces')
          .where('categorie', isEqualTo: cat)
          .where('governorate', isEqualTo: '$city ')
          .where('announce_Price', isGreaterThan: minPrice)
          .where('announce_Price', isLessThan: maxPrice)
          .where('condition', isEqualTo: condition)
          .snapshots();
  Stream<QuerySnapshot> getAnnounceBYCategorieAndTitle(
    String? title,
    String? cat,
  ) =>
      FirebaseFirestore.instance
          .collection('Announces')
          .where('categorie', isEqualTo: cat)
          .where('SearchKey', arrayContains: title)
          .snapshots();
  Stream<QuerySnapshot> getAnnounceByCategorie(
    String? cat,
  ) =>
      FirebaseFirestore.instance
          .collection('Announces')
          .where('categorie', isEqualTo: cat)
          .snapshots();

  Future<List<DocumentSnapshot>> getSearch() async =>
      await FirebaseFirestore.instance
          .collection('Announces')
          .get()
          .then((snaps) {
        return snaps.docs;
      });
  Future<List<DocumentSnapshot>> getuserSearch() async =>
      await FirebaseFirestore.instance.collection('users').get().then((snaps) {
        return snaps.docs;
      });

  Future<List<DocumentSnapshot>> getSuggestion(String suggestion) async =>
      await FirebaseFirestore.instance
          .collection('Announces')
          .where('announce_Title', isGreaterThanOrEqualTo: suggestion)
          .get()
          .then((snap) {
        return snap.docs;
      });
}
