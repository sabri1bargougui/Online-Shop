import 'package:another_xlider/another_xlider.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Research/Widget/Search_Screen_After_Filter.dart';

class ResearchFilterScreen extends StatefulWidget {
  ResearchFilterScreen({Key? key}) : super(key: key);

  @override
  _ResearchFilterScreenState createState() => _ResearchFilterScreenState();
}

class _ResearchFilterScreenState extends State<ResearchFilterScreen> {
  String? cat;
  String? condition;
  String? minPrice;
  String? maxPrice;
  String? city;
  final categorieList = [
    Text("Tous les catégories"),
    Text("Informatique"),
    Text("Motos"),
    Text("Multimédia"),
    Text("Voitures"),
    Text("Autres"),
    Text("Immobilier"),
  ];
  final conditionList = [
    Text('All'),
    Text("Utilisé"),
    Text("Neuf(trés bon etat)"),
  ];
  final cityList = [
    Text('Toutes la tunisie'),
    Text('Ariana'),
    Text('Béja'),
    Text('Ben Arous'),
    Text('Bizerte'),
    Text('Gabès'),
    Text('Gafsa'),
    Text('Jendouba'),
    Text('Kairouan'),
    Text('Kasserine'),
    Text('Kébili'),
    Text('Kef'),
    Text('Mahdia'),
    Text('Manouba'),
    Text('Médenine'),
    Text('Monastir'),
    Text('Nabeul'),
    Text('Sfax'),
    Text('Sousse'),
    Text('Sidi Bouzid'),
    Text('Siliana'),
    Text('Tataouine'),
    Text('Tozeur'),
    Text('Tunis'),
    Text('Zaghouan'),
  ];
  double _lowerValue = 10;
  double _upperValue = 900000;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,
        backgroundColor: KbackgroundColor,
        primary: true,
        toolbarHeight: 60,
        title: Row(
          children: [
            SizedBox(width: 80),
            Center(
              child: Text(
                "Recherche",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            // ** All categories **  //
            ListTile(
              onTap: () {
                BottomPicker(
                  title: 'Categories',
                  items: categorieList,
                  dismissable: true,
                  onSubmit: (index) {
                    if (index == 0) {
                      setState(() {
                        cat = null;
                      });
                    } else if (index == 1) {
                      setState(() {
                        cat = 'Informatique';
                      });
                    } else if (index == 2) {
                      setState(() {
                        cat = 'Motos';
                      });
                    } else if (index == 3) {
                      setState(() {
                        cat = 'Multimédia';
                      });
                    } else if (index == 4) {
                      setState(() {
                        cat = 'Voitures';
                      });
                    } else if (index == 5) {
                      setState(() {
                        cat = 'Autres';
                      });
                    } else if (index == 6) {
                      setState(() {
                        cat = 'Immobilier';
                      });
                    }
                  },
                ).show(context);
              },
              title: cat == null ? Text("Tous les catégories") : Text('$cat'),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                size: 30,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Divider(
                thickness: 2,
                color: Colors.grey[200],
              ),
            ),
            // ***  Location **//
            InkWell(
              onTap: () {
                BottomPicker(
                  title: 'Gouvernorate',
                  items: cityList,
                  dismissable: true,
                  onSubmit: (index) {
                    if (index == 0) {
                      setState(() {
                        city = null;
                      });
                    } else if (index == 1) {
                      setState(() {
                        city = 'Ariana';
                      });
                    } else if (index == 2) {
                      setState(() {
                        city = 'Béja';
                      });
                    } else if (index == 3) {
                      setState(() {
                        city = 'Ben Arous';
                      });
                    } else if (index == 4) {
                      setState(() {
                        city = 'Bizerte';
                      });
                    } else if (index == 5) {
                      setState(() {
                        city = 'Gabès';
                      });
                    } else if (index == 6) {
                      setState(() {
                        city = 'Gafsa';
                      });
                    } else if (index == 7) {
                      setState(() {
                        city = 'Jendouba';
                      });
                    } else if (index == 8) {
                      setState(() {
                        city = 'Kairouan';
                      });
                    } else if (index == 9) {
                      setState(() {
                        city = 'Kasserine';
                      });
                    } else if (index == 10) {
                      setState(() {
                        city = 'Kébili';
                      });
                    } else if (index == 11) {
                      setState(() {
                        city = 'Kef';
                      });
                    } else if (index == 12) {
                      setState(() {
                        city = 'Mahdia';
                      });
                    } else if (index == 13) {
                      setState(() {
                        city = 'Manouba';
                      });
                    } else if (index == 14) {
                      setState(() {
                        city = 'Médenine';
                      });
                    } else if (index == 15) {
                      setState(() {
                        city = 'Monastir';
                      });
                    } else if (index == 16) {
                      setState(() {
                        city = 'Nabeul';
                      });
                    } else if (index == 17) {
                      setState(() {
                        city = 'Sfax';
                      });
                    } else if (index == 18) {
                      setState(() {
                        city = 'Sousse';
                      });
                    } else if (index == 19) {
                      setState(() {
                        city = 'Sidi Bouzid';
                      });
                    } else if (index == 20) {
                      setState(() {
                        city = 'Siliana';
                      });
                    } else if (index == 21) {
                      setState(() {
                        city = 'Tataouine';
                      });
                    } else if (index == 22) {
                      setState(() {
                        city = 'Tozeur';
                      });
                    } else if (index == 23) {
                      setState(() {
                        city = 'Tunis';
                      });
                    } else if (index == 24) {
                      setState(() {
                        city = 'Zaghouan';
                      });
                    }
                  },
                ).show(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 16, top: 10, bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(city == null ? "Toutes la tunisie" : '$city'),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Divider(
                thickness: 2,
                color: Colors.grey[200],
              ),
            ),
            // ** Condition ** //
            ListTile(
              onTap: () {
                BottomPicker(
                  title: 'Condition',
                  items: conditionList,
                  dismissable: true,
                  onSubmit: (index) {
                    if (index == 0) {
                      setState(() {
                        condition = null;
                      });
                    } else if (index == 1) {
                      setState(() {
                        condition = 'Utilisé';
                      });
                    } else if (index == 2) {
                      setState(() {
                        condition = 'Neuf';
                      });
                    }
                  },
                ).show(context);
              },
              title: condition == null ? Text("Condition") : Text('$condition'),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                size: 30,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Divider(
                thickness: 2,
                color: Colors.grey[200],
              ),
            ),
            // ** Model ** //
            /* ListTile(
              onTap: () {},
              title: Text("Model"),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                size: 30,
                color: Colors.black,
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Divider(
                thickness: 2,
                color: Colors.grey[200],
              ),
            ),
            SizedBox(height: 10),
            // ***  Slider ***  //
            Padding(
              padding: EdgeInsets.only(right: width > 320 ? 350 : 200),
              child: Text(
                "Prix",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: FlutterSlider(
                rangeSlider: true,
                values: [_lowerValue, _upperValue],
                min: 0,
                max: 1000000,
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  setState(() {
                    _lowerValue = lowerValue;
                    _upperValue = upperValue;
                  });
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$_lowerValue dt",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$_upperValue dt",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: height > 820 ? 180 : 90),
            // ** button ** //
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13.0),
                child: Container(
                  width: 330,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreenAfterFilter(
                                  maxPrice: _upperValue,
                                  minPrice: _lowerValue,
                                  cat: cat,
                                  condition: condition,
                                  city: city,
                                )),
                      );
                    },
                    child: Text(
                      'Rechercher',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
