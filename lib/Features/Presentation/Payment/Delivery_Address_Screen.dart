import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Main/Main_Screen.dart';
import 'package:happy_shop/Features/Presentation/Payment/Info_Screen.dart';

class DeliveryAddressScreen extends StatefulWidget {
  DeliveryAddressScreen({Key? key}) : super(key: key);

  @override
  _DeliveryAddressScreenState createState() => _DeliveryAddressScreenState();
}

enum SingingCharacter { lafayette, jefferson }

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,
        backgroundColor: KbackgroundColor,
        primary: true,
        toolbarHeight: 60,
        title: Center(
          child: Text(
            "Étape1/3-Livraison",
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ],
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              /// *** Product Details *** ///
              ///
              ///

              Container(
                height: 113,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://5.imimg.com/data5/IR/XG/MY-64263044/ps4-pro-sony-playstation-4-pro-1tb-black-console-500x500.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 200,
                                  child: Text(
                                    "Sony PS4 console 500 Gb with 2 games black",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 5,
                                    color: Colors.grey[600],
                                  ),
                                  Text(
                                    "Condition:",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "Utilisé",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              Container(
                                height: 50,
                                width: double.infinity,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 10,
                                      child: Text(
                                        "650.00",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Positioned(
                                      top: 7,
                                      left: 60,
                                      child: Text(
                                        "dt",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 20,
                                      child: Row(
                                        children: [
                                          Text('Qte '),
                                          Text('1'),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.arrow_drop_down),
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
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 3,
                color: Colors.grey[200],
              ),
              SizedBox(height: 8),
              // *** delivery address **** //
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Livraison",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "BuyDelivery vous livre votre colis en toute sécurité",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "en point BuyDelivery sous 1-3 jours",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Trouver les points relais autour de :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Adresse",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),

              /// *** Search Bar *** ///
              ///
              ///

              Padding(
                padding: const EdgeInsets.only(left: 12, right: 16),
                child: Container(
                  height: 80,
                  width: 400,
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 330,
                        child: FloatingSearchBar(
                          elevation: 0.9,
                          automaticallyImplyBackButton: false,
                          backdropColor: Colors.transparent,
                          hint: 'Search...',
                          scrollPadding:
                              const EdgeInsets.only(top: 16, bottom: 56),
                          transitionDuration: const Duration(milliseconds: 800),
                          transitionCurve: Curves.easeInOut,
                          physics: const BouncingScrollPhysics(),
                          openAxisAlignment: 0.0,
                          debounceDelay: const Duration(milliseconds: 500),
                          onQueryChanged: (query) {},
                          transition: CircularFloatingSearchBarTransition(),
                          actions: [
                            FloatingSearchBarAction(
                              showIfOpened: false,
                              child: CircularButton(
                                icon: const Icon(Icons.place),
                                onPressed: () {},
                              ),
                            ),
                            FloatingSearchBarAction.searchToClear(
                              showIfClosed: false,
                            ),
                          ],
                          builder: (context, transition) {
                            return Container(
                              color: Colors.transparent,
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 330,
                        child: Icon(Icons.gps_fixed),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Points relais autour de cette adresse :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              /// *** related adress *** ///
              ///
              ///
              relatedadress(),

              SizedBox(height: 20),

              /// **** Total price *** ///
              ///
              ///
              ///

              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 8,
                        child: Text(
                          'Total',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 2,
                        right: 16,
                        child: Text(
                          '650.00',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Text(
                          'dt',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //// ** button *** ///
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(243, 224, 8, 1),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserInfoScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Étape2/3 : payer',
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
      ),
    );
  }

  /// *** Related Adress *** ///

  Column relatedadress() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 16),
          child: ListTile(
            trailing: Text('240mm'),
            title: Text(
              'La Manouba',
              style: headine3,
            ),
            subtitle: Text(
              'Avenue HAbib Bouguiba la manouba TN 2010,ave Habib Bourguiba',
            ),
            leading: Radio<SingingCharacter>(
              activeColor:
                  MaterialStateColor.resolveWith((states) => Colors.red),
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ),
        Divider(
          color: Colors.grey[300],
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 16),
          child: ListTile(
            trailing: Text('240mm'),
            title: Text(
              'La Manouba',
              style: headine3,
            ),
            subtitle: Text(
              'Avenue HAbib Bouguiba la manouba TN 2010,ave Habib Bourguiba',
            ),
            leading: Radio<SingingCharacter>(
              activeColor:
                  MaterialStateColor.resolveWith((states) => Colors.red),
              value: SingingCharacter.jefferson,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(
                  () {
                    _character = value;
                  },
                );
              },
            ),
          ),
        ),
        Divider(
          color: Colors.grey[300],
          thickness: 1,
        ),
      ],
    );
  }
}
