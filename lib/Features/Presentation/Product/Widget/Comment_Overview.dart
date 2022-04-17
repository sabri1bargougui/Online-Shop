import 'package:flutter/material.dart';

class CommentOverviewModel extends StatelessWidget {
  final String clienNAme;
  final String dateTme;
  final String commentTitle;
  final String commentDescription;
  const CommentOverviewModel({
    Key? key,
    required this.clienNAme,
    required this.dateTme,
    required this.commentTitle,
    required this.commentDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Alexander boom",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "1 Aout 2020",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 15,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.star, color: Colors.black, size: 13),
            Icon(Icons.star, color: Colors.black, size: 13),
            Icon(Icons.star, color: Colors.black, size: 13),
            Icon(Icons.star, color: Colors.black, size: 13),
            Icon(Icons.star, color: Colors.black, size: 13),
          ],
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "C'est génial",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Wow, comment puis-je vous parler de cet appareil",
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ),
        Divider(
          thickness: 2,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}
