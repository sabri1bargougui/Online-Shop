import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:happy_shop/Features/Data/Models/Channel_Model.dart';
import 'package:happy_shop/Features/Domain/fire_store.dart';

class ChatServices {
  final FireStoreService _fireStoreService = FireStoreService();

  Future createChatRooms(
    String createdAT,
    String senderID,
    String senderName,
    String senderLastname,
    String senderAvatar,
    String receiverid,
    String receiverAvatar,
    String receiverName,
    String announceID,
    String announceTitle,
    String announceImage,
    double announcePrice,
    String announceCategorie,
    String channelID,
  ) async {
    try {
      _fireStoreService.createChannel(
        ChannelModel(
            createdAT: createdAT,
            participants: [receiverid, senderID],
            channelID: channelID,
            users: {
              'Sender_Name': '$senderName $senderLastname',
              'receiver_Name': '$receiverName',
              'Sender_Avatar': senderAvatar,
              'receiver_Avatar': receiverAvatar,
              'SenderID': senderID,
              'receiverID': receiverid,
            },
            announce: {
              'announceID': announceID,
              'announce_Title': announceTitle,
              'announce_Image': announceImage,
              'announce_Price': announcePrice,
              'announce_Categorie': announceCategorie,
            }),
      );
    } catch (e) {}
  }

  Future updateChannelDaate(
    String? channelID,
  ) async {
    await FirebaseFirestore.instance
        .collection('Channels')
        .doc(channelID)
        .update({
      'createdAT': DateTime.now().millisecondsSinceEpoch,
    });
  }
}
