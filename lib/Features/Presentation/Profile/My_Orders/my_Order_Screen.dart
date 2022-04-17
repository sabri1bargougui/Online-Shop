import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Widgets/Empty_Widget.dart';

class MyOrderScreen extends StatefulWidget {
  MyOrderScreen({Key? key}) : super(key: key);

  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: new AppBar(
        bottomOpacity: 0.0,
        title: Row(
          children: [
            SizedBox(width: width > 320 ? 90 : 40),
            Center(
              child: new Text(
                "Compte",
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
        backgroundColor: KbackgroundColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Center(
              child: Text(
                "Mes achats",
                style: headine20,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Center(
                child: Text(
                  "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur",
                  style: headline7,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Divider(
                thickness: 4,
                color: Colors.grey[300],
              ),
            ),
            EmptyWidgetScreen(
              subtitle: 'Bientôt disponible',
              title: 'Bientôt disponible',
              imageUrl: 'assets/icons/empty.png',
            )
            /*  Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 55,
                child: TextFormField(
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: 'Rechercher dans toutes les catégories',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: height < 600 ? 0.4 : 0.5,
                  crossAxisSpacing: 2,
                ),
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return AnnounceePreviewWidget();
                },
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
