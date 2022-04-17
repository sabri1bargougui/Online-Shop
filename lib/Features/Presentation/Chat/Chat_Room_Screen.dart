import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Core/Shared/user_info.dart';
import 'package:happy_shop/Features/Domain/Chat/chat_services.dart';

class ChatRoomScreen extends StatefulWidget {
  final String recieverID;
  final String recieveravatr;
  final String recieverName;
  final String channelID;

  ChatRoomScreen({
    Key? key,
    required this.recieverID,
    required this.recieveravatr,
    required this.recieverName,
    required this.channelID,
  }) : super(key: key);

  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  ChatServices _chatsevices = ChatServices();
  String? chatroomID;

  void readlocal() {
    if (UserInfoData.userID!.compareTo(widget.recieverID) > 0) {
      chatroomID = '${UserInfoData.userID}-${widget.recieverID}';
    } else {
      chatroomID = '${widget.recieverID}-${UserInfoData.userID}';
    }
  }

  @override
  void initState() {
    readlocal();
    super.initState();
  }

  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();
  var m = <ChatMessage>[];
  var i = 0;

  final ChatUser user = ChatUser(
    name: UserInfoData.username,
    uid: UserInfoData.userID,
    avatar: UserInfoData.userAvatarUrl,
    color: Colors.black,
    containerColor: KbackgroundColor,
  );

  List<ChatMessage> messages = <ChatMessage>[];

  void systemMessage() {
    Timer(Duration(milliseconds: 300), () {
      if (i < 6) {
        setState(() {
          messages = [...messages, m[i]];
        });
        i++;
      }
      Timer(Duration(milliseconds: 300), () {
        _chatViewKey.currentState!.scrollController
          ..animateTo(
            _chatViewKey
                .currentState!.scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
      });
    });
  }

  void onSend(ChatMessage message) {
    FirebaseFirestore.instance
        .collection('Channels')
        .doc(chatroomID)
        .collection("messages")
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(message.toJson());
    _chatsevices.updateChannelDaate(widget.channelID);

    setState(() {
      messages = [...messages, message];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: KbackgroundColor,
        bottomOpacity: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                widget.recieveravatr,
              ),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(width: 15),
            Center(
              child: Text(
                widget.recieverName.toUpperCase(),
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
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Channels')
            .doc(chatroomID)
            .collection("messages")
            .orderBy("createdAt")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            );
          } else {
            List<DocumentSnapshot> items = snapshot.data!.docs;
            var messages = items
                .map((i) =>
                    ChatMessage.fromJson(i.data() as Map<String, dynamic>))
                .toList();
            return DashChat(
              key: _chatViewKey,
              inverted: false,
              onSend: onSend,
              sendOnEnter: true,
              textInputAction: TextInputAction.send,
              user: user,
              inputDecoration:
                  InputDecoration.collapsed(hintText: "Add message here..."),
              dateFormat: DateFormat('yyyy-MMM-dd'),
              timeFormat: DateFormat('HH:mm'),
              messages: messages,
              showUserAvatar: false,
              showAvatarForEveryMessage: false,
              scrollToBottom: false,
              inputMaxLines: 5,
              messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
              alwaysShowSend: false,
              inputTextStyle: TextStyle(fontSize: 16.0),
              inputContainerStyle: BoxDecoration(
                border: Border.all(width: 0.0),
                color: Colors.lightBlueAccent,
              ),
              onQuickReply: (Reply reply) {
                setState(() {
                  messages.add(
                    ChatMessage(
                      text: reply.value,
                      createdAt: DateTime.now(),
                      user: user,
                    ),
                  );

                  messages = [...messages];
                });

                Timer(Duration(milliseconds: 300), () {
                  _chatViewKey.currentState!.scrollController
                    ..animateTo(
                      _chatViewKey.currentState!.scrollController.position
                          .maxScrollExtent,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 300),
                    );

                  if (i == 0) {
                    systemMessage();
                    Timer(Duration(milliseconds: 600), () {
                      systemMessage();
                    });
                  } else {
                    systemMessage();
                  }
                });
              },
              shouldShowLoadEarlier: true,
              showTraillingBeforeSend: true,
              trailing: <Widget>[
                IconButton(
                  icon: Icon(Icons.photo),
                  onPressed: () async {
                    final picker = ImagePicker();
                    XFile? result = await picker.pickImage(
                      source: ImageSource.gallery,
                    );

                    if (result != null) {
                      final Reference storageRef =
                          FirebaseStorage.instance.ref().child("chat_images");

                      final taskSnapshot = await storageRef.putFile(
                        File(result.path),
                      );

                      String url = await taskSnapshot.ref.getDownloadURL();

                      ChatMessage message =
                          ChatMessage(text: "", user: user, image: url);

                      FirebaseFirestore.instance
                          .collection('Channels')
                          .doc(widget.channelID)
                          .collection("messages")
                          .add(message.toJson());
                    }
                  },
                )
              ],
            );
          }
        },
      ),
    );
  }
}
