import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';

class CategoryWidget extends StatelessWidget {
  final String firstname;
  final String secondename;
  final String imageasset;
  const CategoryWidget({
    Key? key,
    required this.firstname,
    required this.secondename,
    required this.imageasset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 170,
        height: 90,
        child: Card(
          shadowColor: Colors.grey,
          color: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 0,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 95,
                    child: Text("$firstname & $secondename", style: headline22),
                  ),
                ),
              ),
              Positioned(
                left: 100,
                top: 0,
                child: Container(
                  height: 60,
                  width: 60,
                  child: Image.asset(imageasset),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
