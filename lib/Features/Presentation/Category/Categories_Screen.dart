import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Category/Category_Widget.dart';
import 'package:happy_shop/Features/Presentation/Research/Research_By_Categories_Screen.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        bottomOpacity: 0.0,
        title: Row(
          children: [
            SizedBox(width: 80),
            Text(
              "Catégories",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'Retrouvez Tous',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          'Nos catégories',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 300,
                    child: Text(
                        'lorem ipsumlorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum  lorem ipsum lorem ipsum '),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResearchByCategoriesScreen(
                            categorie: 'Informatique',
                          ),
                        ),
                      );
                    },
                    child: CategoriesWidget(
                      title: "Informatique",
                      icon: "assets/icons/computer.svg",
                    ),
                  ),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResearchByCategoriesScreen(
                            categorie: 'Multimédia',
                          ),
                        ),
                      );
                    },
                    child: CategoriesWidget(
                      title: "Multimédia",
                      icon: "assets/icons/video.svg",
                    ),
                  ),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResearchByCategoriesScreen(
                            categorie: 'Voitures',
                          ),
                        ),
                      );
                    },
                    child: CategoriesWidget(
                      title: "Voitures",
                      icon: "assets/icons/car.svg",
                    ),
                  ),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResearchByCategoriesScreen(
                            categorie: 'Motos',
                          ),
                        ),
                      );
                    },
                    child: CategoriesWidget(
                      title: "Motos",
                      icon: "assets/icons/motorcycle.svg",
                    ),
                  ),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResearchByCategoriesScreen(
                            categorie: 'Immobilier',
                          ),
                        ),
                      );
                    },
                    child: CategoriesWidget(
                      title: "Immobilier",
                      icon: "assets/icons/hotel.svg",
                    ),
                  ),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResearchByCategoriesScreen(
                            categorie: 'Autres',
                          ),
                        ),
                      );
                    },
                    child: CategoriesWidget(
                      title: "Autre",
                      icon: "assets/icons/hotel.svg",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
