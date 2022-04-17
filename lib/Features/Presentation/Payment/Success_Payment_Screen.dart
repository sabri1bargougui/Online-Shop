import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Main/Main_Screen.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 200),
            Center(
              child: Container(
                child: SvgPicture.asset(
                  "assets/icons/paymentconfirmed.svg",
                  height: 300,
                  width: 300,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Génial!",
              style: headine2,
            ),
            Text(
              "La commande est en route",
              style: headine2,
            ),
            SizedBox(height: 140),

            /// **** button *** ///
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
                          builder: (context) => MainScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Acheter autre chose',
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
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
