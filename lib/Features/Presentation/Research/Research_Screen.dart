import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Domain/Search/Search_Services.dart';
import 'package:happy_shop/Features/Presentation/Research/Widget/Research_Filter_Screen.dart';

class ResearchScreen extends StatefulWidget {
  ResearchScreen({Key? key}) : super(key: key);

  @override
  _ResearchScreenState createState() => _ResearchScreenState();
}

class _ResearchScreenState extends State<ResearchScreen> {
  SearchService _searchService = SearchService();
  List<Map> search = <Map>[];
  @override
  void initState() {
    getDocs();
    super.initState();
  }

  Future getDocs() async {
    search = (await _searchService.getSearch())
        .map((item) => item.data)
        .cast<Map>()
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
            SizedBox(height: 20),

            /*      Hero(
              tag: "Reasearch",
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  elevation: 0,
                  shadowColor: Colors.grey,
                  child: ListTile(
                    title: TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Rechercher sur Buy ",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    leading: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ),
            // ), */
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                    autofocus: false,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1.0),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(32.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      hintText: ('Enter the Name of item'),
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                      ),
                    )),
                suggestionsCallback: (pattern) {
                  return search.where(
                    (doc) => jsonEncode(doc)
                        .toLowerCase()
                        .contains(pattern.toLowerCase()),
                  );
                },
                itemBuilder: (context, suggestion) {
                  return Card(
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 6.0,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            suggestion.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                onSuggestionSelected: (suggestion) {},
              ),
            ),
            SizedBox(height: height > 600 ? 250 : 300),
            Divider(
              thickness: 2,
              color: Colors.grey[200],
            ),
            Padding(
              padding: EdgeInsets.only(left: 70),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResearchFilterScreen(),
                    ),
                  );
                },
                title: Text(
                  "FILTRER LA RECHERCHE",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.filter_list,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
