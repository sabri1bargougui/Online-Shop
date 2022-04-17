import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Chat/Chat_Room_Screen.dart';

class ChatWidget extends StatelessWidget {
  final String imageUrl;
  final String time;
  final String message;
  final String userNAme;
  final String? channelID;
  final String? recieverID;

  const ChatWidget({
    Key? key,
    required this.imageUrl,
    required this.time,
    required this.message,
    required this.userNAme,
    this.channelID,
    this.recieverID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatRoomScreen(
                      channelID: this.channelID!,
                      recieveravatr: this.imageUrl,
                      recieverID: this.recieverID!,
                      recieverName: this.userNAme,
                    )),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage: NetworkImage(imageUrl),
                          backgroundColor: Colors.transparent,
                        ),
                        Positioned(
                          left: 60,
                          top: 0,
                          child: Text(
                            userNAme.toUpperCase(),
                            style: headline12,
                          ),
                        ),
                        Positioned(
                          left: 330,
                          child: Text(
                            time,
                            style: headline14,
                          ),
                        ),
                        Positioned(
                          top: 25,
                          left: 60,
                          child: Text(
                            message,
                            style: headline6,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
