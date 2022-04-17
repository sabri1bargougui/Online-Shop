import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Research/Research_Screen.dart';

class HomeSearchAppBar extends StatelessWidget {
  const HomeSearchAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 59, 226, 255),
      child: Column(
        children: [
          SizedBox(height: 60),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            height: 50,
            width: 380,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3, left: 10),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.black, size: 25),
                        SizedBox(width: 5),
                        Container(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "What were you looking for?",
                              border: InputBorder.none,
                              hintStyle: headline25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    thickness: 2,
                    color: Colors.grey[200],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResearchScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 2, left: 2),
                      child: Row(
                        children: [
                          Text(
                            "Categories",
                            style: headline25,
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 25,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
