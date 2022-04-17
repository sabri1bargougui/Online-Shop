import 'package:flutter/material.dart';

import 'Message_Widget.dart';

class UsersChatWidget extends StatefulWidget {
  UsersChatWidget({Key? key}) : super(key: key);

  @override
  _UsersChatWidgetState createState() => _UsersChatWidgetState();
}

class _UsersChatWidgetState extends State<UsersChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.grey[200],
                filled: true,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
        ),
        Column(
          children: [
            ChatWidget(
              imageUrl:
                  'https://cdn3.vectorstock.com/i/1000x1000/30/97/flat-business-man-user-profile-avatar-icon-vector-4333097.jpg',
              message: 'prix slvp?',
              time: '20:20',
              userNAme: 'Ahmed Gammoudi',
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[200],
            ),
            ChatWidget(
              imageUrl:
                  'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg',
              message: 'prix slvp?',
              time: '20:20',
              userNAme: 'Sabri Bargougui',
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[200],
            ),
            ChatWidget(
              imageUrl: 'https://data.whicdn.com/images/322027365/original.jpg',
              message: 'prix slvp?',
              time: '20:20',
              userNAme: 'Yasmine Baccari',
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[200],
            ),
            ChatWidget(
              imageUrl:
                  'https://cdn3.vectorstock.com/i/1000x1000/30/97/flat-business-man-user-profile-avatar-icon-vector-4333097.jpg',
              message: 'prix slvp?',
              time: '20:20',
              userNAme: 'Fakhreddin Bel gaied',
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[200],
            ),
            ChatWidget(
              imageUrl:
                  'https://cdn3.vectorstock.com/i/1000x1000/30/97/flat-business-man-user-profile-avatar-icon-vector-4333097.jpg',
              message: 'prix slvp?',
              time: '20:20',
              userNAme: 'Ahmed Ben Ali',
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[200],
            ),
            ChatWidget(
              imageUrl:
                  'https://cdn3.vectorstock.com/i/1000x1000/30/97/flat-business-man-user-profile-avatar-icon-vector-4333097.jpg',
              message: 'prix slvp?',
              time: '20:20',
              userNAme: 'Ahmed Ben Ali',
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[200],
            ),
            ChatWidget(
              imageUrl:
                  'https://cdn3.vectorstock.com/i/1000x1000/30/97/flat-business-man-user-profile-avatar-icon-vector-4333097.jpg',
              message: 'prix slvp?',
              time: '20:20',
              userNAme: 'Ahmed Ben Ali',
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[200],
            ),
            ChatWidget(
              imageUrl:
                  'https://cdn3.vectorstock.com/i/1000x1000/30/97/flat-business-man-user-profile-avatar-icon-vector-4333097.jpg',
              message: 'prix slvp?',
              time: '20:20',
              userNAme: 'Ahmed Ben Ali',
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[200],
            ),
            ChatWidget(
              imageUrl:
                  'https://cdn3.vectorstock.com/i/1000x1000/30/97/flat-business-man-user-profile-avatar-icon-vector-4333097.jpg',
              message: 'prix slvp?',
              time: '20:20',
              userNAme: 'Ahmed Ben Ali',
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[200],
            ),
            ChatWidget(
              imageUrl:
                  'https://cdn3.vectorstock.com/i/1000x1000/30/97/flat-business-man-user-profile-avatar-icon-vector-4333097.jpg',
              message: 'prix slvp?',
              time: '20:20',
              userNAme: 'Ahmed Ben Ali',
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[200],
            ),
            ChatWidget(
              imageUrl:
                  'https://cdn3.vectorstock.com/i/1000x1000/30/97/flat-business-man-user-profile-avatar-icon-vector-4333097.jpg',
              message: 'prix slvp?',
              time: '20:20',
              userNAme: 'Ahmed Ben Ali',
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[200],
            ),
          ],
        )
      ],
    );
  }
}
