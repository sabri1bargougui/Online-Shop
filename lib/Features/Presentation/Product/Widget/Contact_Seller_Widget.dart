import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:happy_shop/Core/Shared/user_info.dart';
import 'package:happy_shop/Features/Domain/Chat/chat_services.dart';
import 'package:happy_shop/Features/Presentation/Chat/Chat_Room_Screen.dart';

class ContactSeller extends StatefulWidget {
  final String recieverID;
  final String recieverAvatar;
  final String recieverName;
  final String announceID;
  final String announceTitle;
  final String announceImage;
  final double announcePrice;
  final String announceCategorie;
  final int recieverPhone;
  ContactSeller({
    Key? key,
    required this.recieverID,
    required this.recieverAvatar,
    required this.recieverName,
    required this.announceID,
    required this.announceTitle,
    required this.announceImage,
    required this.announcePrice,
    required this.announceCategorie,
    required this.recieverPhone,
  }) : super(key: key);

  @override
  _ContactSellerState createState() => _ContactSellerState();
}

class _ContactSellerState extends State<ContactSeller> {
  String? channelID;

  void readlocal() {
    if (UserInfoData.userID != widget.recieverID) {
      channelID = '${UserInfoData.userID}-${widget.recieverID}';
    } else {
      channelID = '${widget.recieverID}-${UserInfoData.userID}';
    }
  }

  @override
  void initState() {
    readlocal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    ChatServices chatservices = ChatServices();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: width > 330 ? 160 : 130,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.grey[300],
            ),
            onPressed: () {
              showMaterialModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return BottomSheet(
                    enableDrag: false,
                    onClosing: () {},
                    builder: (BuildContext context) {
                      bool _iscontactPhoneSelected = true;
                      bool _isContactMessageSelected = false;
                      return StatefulBuilder(
                        builder: (BuildContext context, setState) => Container(
                          height: 360,
                          width: 100,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    "How do you contact him?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.grey[300],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(width: 0),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              _isContactMessageSelected = false;

                                              _iscontactPhoneSelected = true;
                                            });
                                          },
                                          child: Container(
                                            width: 170,
                                            height: 60,
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              color: _iscontactPhoneSelected
                                                  ? Colors.lightBlueAccent
                                                  : Colors.grey[200],
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 16,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.phone_android),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      'By telephone',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            final String date = DateTime.now()
                                                .millisecondsSinceEpoch
                                                .toString();
                                            final String senderUid =
                                                UserInfoData.userID!;
                                            final String senderName =
                                                UserInfoData.username!;
                                            final String senderLastName =
                                                UserInfoData.userLastName!;
                                            final String senderAvatar =
                                                UserInfoData.userAvatarUrl!;
                                            final String recieverName =
                                                widget.recieverName;

                                            final String recieverID =
                                                widget.recieverID;
                                            final String reciverAvatar =
                                                widget.recieverAvatar;
                                            final String announceID =
                                                widget.announceID;

                                            final String announceTitle =
                                                widget.announceTitle;
                                            final double announcePrice =
                                                widget.announcePrice;
                                            final String announceImage =
                                                widget.announceImage;

                                            final String announcecategorie =
                                                widget.announceCategorie;

                                            await chatservices
                                                .createChatRooms(
                                                  date,
                                                  senderUid,
                                                  senderName,
                                                  senderLastName,
                                                  senderAvatar,
                                                  recieverID,
                                                  reciverAvatar,
                                                  recieverName,
                                                  announceID,
                                                  announceTitle,
                                                  announceImage,
                                                  announcePrice,
                                                  announcecategorie,
                                                  channelID!,
                                                )
                                                .whenComplete(() =>
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChatRoomScreen(
                                                          recieveravatr:
                                                              reciverAvatar,
                                                          recieverName:
                                                              recieverName,
                                                          recieverID:
                                                              recieverID,
                                                          channelID: channelID!,
                                                        ),
                                                      ),
                                                    ));

                                            setState(() {
                                              _isContactMessageSelected = true;

                                              _iscontactPhoneSelected = false;
                                            });
                                          },
                                          child: Container(
                                            width: 170,
                                            height: 60,
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              color: _isContactMessageSelected
                                                  ? Colors.lightBlueAccent
                                                  : Colors.grey[200],
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 16,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.chat_bubble_outline,
                                                    ),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      'By message',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 100),
                                  _iscontactPhoneSelected
                                      ? Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            width: 350,
                                            height: 70,
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              color: Colors.lightBlueAccent,
                                              child: Center(
                                                child: Text(
                                                  widget.recieverPhone
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: Text(
              'Contact',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
