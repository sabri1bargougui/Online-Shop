import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Core/Shared/shared_preferences.dart';
import 'package:happy_shop/Core/Shared/user_info.dart';
import 'package:happy_shop/Features/Presentation/Chat/Widgets/Message_Widget.dart';

class ChatMainScreen extends StatefulWidget {
  ChatMainScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ChatMainScreenState createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future getUserInfo() async {
    UserInfoData.username = (await SharedPreferncesService.getuserName())!;
    UserInfoData.userLastName =
        (await SharedPreferncesService.getuserLastName())!;
    UserInfoData.userEmail = (await SharedPreferncesService.getuserEmail())!;
    UserInfoData.userDate = (await SharedPreferncesService.getUserDate())!;
    UserInfoData.userID = (await SharedPreferncesService.getuserID())!;
    UserInfoData.userAvatarUrl =
        (await SharedPreferncesService.getUserImage())!;
    UserInfoData.userPhoneNumber =
        (await SharedPreferncesService.getuserPhone())!;
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

//  bool _isUtilisateurSelected = true;
  // bool _isExpertSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        bottomOpacity: 0.0,
        title: Center(
          child: Row(
            children: [
              SizedBox(width: 130),
              Center(
                child: new Text(
                  "Messages",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: KbackgroundColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 20),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Channels')
                  .where('participants', arrayContains: _auth.currentUser!.uid)
                  .orderBy('createdAT', descending: true)
                  .snapshots(),
              builder: (context, snapshots) {
                if (snapshots.connectionState == ConnectionState.active) {
                  List<DocumentSnapshot> channels = snapshots.data!.docs;
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                        itemCount: channels.length,
                        itemBuilder: (context, index) {
                          return StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('Channels')
                                  .doc(channels[index]['channelID'])
                                  .collection('messages')
                                  .orderBy('createdAt', descending: true)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.active) {
                                  List<DocumentSnapshot> messages =
                                      snapshot.data!.docs;

                                  if (channels.isEmpty) {
                                    return Container();
                                  } else if (channels[index]['Users']
                                          ['SenderID'] ==
                                      _auth.currentUser!.uid) {
                                    return ChatWidget(
                                      imageUrl: channels[index]['Users']
                                          ['receiver_Avatar'],
                                      time: DateTime.fromMillisecondsSinceEpoch(
                                                  messages[index]['createdAt'])
                                              .hour
                                              .toString() +
                                          ':' +
                                          DateTime.fromMillisecondsSinceEpoch(
                                                  messages[index]['createdAt'])
                                              .minute
                                              .toString(),
                                      message: messages[index]['image'] != null
                                          ? 'image..'
                                          : messages[index]['text'],
                                      userNAme: channels[index]['Users']
                                          ['receiver_Name'],
                                      recieverID: channels[index]['Users']
                                          ['receiverID'],
                                      channelID: channels[index]['channelID'],
                                    );
                                  } else
                                    return ChatWidget(
                                      imageUrl: channels[index]['Users']
                                          ['Sender_Avatar'],
                                      time: DateTime.fromMillisecondsSinceEpoch(
                                                  messages[index]['createdAt'])
                                              .hour
                                              .toString() +
                                          ':' +
                                          DateTime.fromMillisecondsSinceEpoch(
                                                  messages[index]['createdAt'])
                                              .minute
                                              .toString(),
                                      message: messages[index]['text'],
                                      userNAme: channels[index]['Users']
                                          ['Sender_Name'],
                                      recieverID: channels[index]['Users']
                                          ['SenderID'],
                                      channelID: channels[index]['channelID'],
                                    );
                                } else
                                  return Center(
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                              });
                        }),
                  );
                } else
                  return Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  );
              })
          /*  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _isUtilisateurSelected = false;

                    _isExpertSelected = true;
                  });
                },
                child: Container(
                  width: 170,
                  height: 50,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.yellow, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: _isExpertSelected ? Colors.yellow : Colors.grey[100],
                    child: Center(
                      child: Text(
                        'Experts',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _isExpertSelected
                              ? Colors.black
                              : Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _isUtilisateurSelected = true;

                    _isExpertSelected = false;
                  });
                },
                child: Container(
                  width: 170,
                  height: 50,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.yellow, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: _isUtilisateurSelected
                        ? Colors.yellow
                        : Colors.grey[200],
                    child: Center(
                      child: Text(
                        'Utilisateurs',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _isUtilisateurSelected
                              ? Colors.black
                              : Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ), */
          /*   Visibility(
            visible: _isExpertSelected,
            child: ExpertChatWidget(),
          ),
          Visibility(
            visible: _isUtilisateurSelected,
            child: UsersChatWidget(),
          ), */
        ],
      ),
    );
  }
}
