import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Payment/Add_Cart_Screen.dart';
import 'package:happy_shop/Features/Presentation/Payment/Success_Payment_Screen.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

enum SingingCharacter { paymee, ceditcard }

class _PaymentScreenState extends State<PaymentScreen> {
  SingingCharacter? _character = SingingCharacter.ceditcard;
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
            SizedBox(width: 65),
            Center(
              child: Text(
                "Étape3/3-Payer",
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              /// **** payment Price **** ///
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.yellow,
                  child: Container(
                    width: 360,
                    height: 80,
                    child: Stack(
                      children: [
                        Positioned(
                          left: width > 320 ? 80 : 30,
                          top: 30,
                          child: Text(
                            "Montant à payer :",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          left: width > 320 ? 225 : 180,
                          top: 30,
                          child: Text(
                            "690.00",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          left: width > 320 ? 285 : 240,
                          top: 25,
                          child: Text(
                            "dt",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              //// **** credit card section **** //
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Carte de crédit et de débit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: ListTile(
                  title: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/mastercard.svg",
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 7),
                      Text(
                        'Carte de crédit',
                        style: headine3,
                      ),
                    ],
                  ),
                  leading: Radio<SingingCharacter>(
                    activeColor:
                        MaterialStateColor.resolveWith((states) => Colors.red),
                    value: SingingCharacter.ceditcard,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Divider(
                thickness: 6,
                color: Colors.grey[300],
              ),
              SizedBox(height: 20),

              //// *** paymee section *** ////
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Autres options de paiement",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: ListTile(
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 50,
                        height: 40,
                        child: Image.asset("assets/icons/paymee.png"),
                      ),
                      SizedBox(width: 7),
                      Text(
                        'Paymee',
                        style: headine3,
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      print(height);
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                  ),
                  leading: Radio<SingingCharacter>(
                    activeColor:
                        MaterialStateColor.resolveWith((states) => Colors.red),
                    value: SingingCharacter.paymee,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Divider(
                thickness: 2,
                color: Colors.grey[300],
              ),

              /// ***  add new card *** ///
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddCartScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        Text(
                          "Ajouter une nouvelle carte",
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: "Regular",
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: (height > 800)
                      ? 190
                      : (height > 580)
                          ? 80
                          : 40),

              /// *** button **** ///
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: 400,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(243, 224, 8, 1),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentSuccessScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 60,
                        width: 400,
                        child: Stack(
                          children: [
                            Positioned(
                              left: (height > 800)
                                  ? 110
                                  : (height > 580)
                                      ? 110
                                      : 50,
                              top: 16,
                              child: Text(
                                "Payer",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Positioned(
                              left: (height > 800)
                                  ? 180
                                  : (height > 580)
                                      ? 170
                                      : 120,
                              top: 16,
                              child: Text(
                                "650.00",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Positioned(
                              left: (height > 800)
                                  ? 250
                                  : (height > 580)
                                      ? 240
                                      : 190,
                              top: 10,
                              child: Text(
                                "dt",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
