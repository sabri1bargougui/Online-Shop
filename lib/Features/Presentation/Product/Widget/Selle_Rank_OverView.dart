import 'package:flutter/material.dart';

class SellerRank extends StatelessWidget {
  const SellerRank({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              Icon(Icons.star, color: Colors.black, size: 15),
              Icon(Icons.star, color: Colors.black, size: 15),
              Icon(Icons.star, color: Colors.black, size: 15),
              Icon(Icons.star, color: Colors.black, size: 15),
              Icon(Icons.star, color: Colors.black, size: 15),
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text("(125 évaluations de produits)"),
        ),
      ],
    );
  }
}
