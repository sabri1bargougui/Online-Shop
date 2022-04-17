import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Announcement/Widgets/Announcement_Category_Screen.dart';

class ItemTitleScreen extends StatefulWidget {
  ItemTitleScreen({Key? key}) : super(key: key);

  @override
  _ItemTitleScreenState createState() => _ItemTitleScreenState();
}

class _ItemTitleScreenState extends State<ItemTitleScreen> {
  final _title = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: new AppBar(
        title: Row(
          children: [
            SizedBox(width: 50),
            Center(
              child: new Text(
                "Publish an announcement",
                style: TextStyle(color: Colors.black),
              ),
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
                child: Text(
                  "Let's start with the basics",
                  style: headine2,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad",
                style: headline7,
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Announce Title",
                  style: headline6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 8),
                        TextFormField(
                          autofocus: true,
                          controller: _title,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "title",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "veuillez saisir le titre de l'annonce";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        //***  Description ***  ///
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Description",
                            style: headline6,
                          ),
                        ),
                        SizedBox(height: 8),

                        TextFormField(
                          maxLines: 5,
                          controller: _description,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'veuillez saisir la description';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// **** button *** ///
              SizedBox(height: height > 570 ? 20 : 50),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: 370,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectCtegoryScreen(
                                announcementTitle: _title.text,
                                decription: _description.text,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
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
}
