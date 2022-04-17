import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Announcement/Informatique/announcement_Informatique_Preview.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class StateAndPriceInformqtiqueItemScreen extends StatefulWidget {
  final String categorie;
  final String announcementTitle;
  final String consoleType;
  final int garentie;
  final String garentieType;
  final String modelNumber;
  final String genericName;
  final String description;
  final List<String> urls;
  StateAndPriceInformqtiqueItemScreen({
    Key? key,
    required this.categorie,
    required this.announcementTitle,
    required this.consoleType,
    required this.garentie,
    required this.garentieType,
    required this.modelNumber,
    required this.genericName,
    required this.description,
    required this.urls,
  }) : super(key: key);

  @override
  _StateAndPriceInformqtiqueItemScreenState createState() =>
      _StateAndPriceInformqtiqueItemScreenState();
}

class _StateAndPriceInformqtiqueItemScreenState
    extends State<StateAndPriceInformqtiqueItemScreen> {
  final _price = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isUsedSelected = false;
  bool _isNewSelected = false;
  String? countryValue;
  String? stateValue;
  String? cityValue;
  String _state = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: KbackgroundColor,
      appBar: new AppBar(
        title: Row(
          children: [
            SizedBox(width: 70),
            Center(
              child: new Text(
                "Price and Condition",
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
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Price",
                    style: headline6,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                height: 65,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: width > 320 ? 100 : 60),
                        Container(
                          width: 160,
                          child: TextFormField(
                            controller: _price,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Price",
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'veuillez saisir le prix';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Text("TND")
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Governorate/Delegation",
                    style: headline6,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Form(
                child: Column(
                  children: [
                    CSCPicker(
                      defaultCountry: DefaultCountry.Tunisia,
                      stateDropdownLabel: "governorate",
                      cityDropdownLabel: "delegation",
                      disableCountry: true,
                      onCountryChanged: (value) {
                        setState(() {
                          countryValue = value;
                        });
                      },
                      onStateChanged: (value) {
                        setState(() {
                          stateValue = value;
                        });
                      },
                      onCityChanged: (value) {
                        setState(() {
                          cityValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              //// **** select state **** ////
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Select Item Condition",
                    style: headline6,
                  ),
                ),
              ),

              SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  setState(() {
                    _isUsedSelected = !_isUsedSelected;
                    _isNewSelected = false;
                    _state = "Utilisé";
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 0),
                  height: 60,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Used',
                    style: _isUsedSelected
                        ? TextStyle(color: Colors.black)
                        : TextStyle(color: Colors.grey),
                  ),
                ),
              ),

              TextButton(
                onPressed: () {
                  setState(() {
                    _isNewSelected = !_isNewSelected;
                    _isUsedSelected = false;
                    _state = "Neuf";
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 0),
                  height: 60,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'New',
                    style: _isNewSelected
                        ? TextStyle(color: Colors.black)
                        : TextStyle(color: Colors.grey),
                  ),
                ),
              ),

              /// **** button *** ///
              SizedBox(
                height: 20,
              ),
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
                        final String categorie = widget.categorie;
                        final String announcementTitle =
                            widget.announcementTitle;

                        final String consoleType = widget.consoleType;
                        final int garentie = widget.garentie;
                        final String garentieType = widget.garentieType;
                        final String modelNumber = widget.modelNumber;
                        final String genericName = widget.genericName;
                        final String description = widget.description;
                        final String gouvernorate = stateValue.toString();
                        final String delegation = cityValue.toString();
                        final String state = _state;
                        final double price = double.parse(_price.text);

                        if (_state.isEmpty ||
                            cityValue!.isEmpty ||
                            stateValue!.isEmpty) {
                          showTopSnackBar(
                            context,
                            CustomSnackBar.info(
                              backgroundColor: Colors.white,
                              message: "Veuillez remplir les champs ",
                              textStyle: TextStyle(color: Colors.red),
                            ),
                          );
                        } else
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AnnouncementInformatiquePreviewScreen(
                                announcementTitle: announcementTitle,
                                categorie: categorie,
                                consoleType: consoleType,
                                delegation: delegation,
                                description: description,
                                garentie: garentie,
                                garentieType: garentieType,
                                genericName: genericName,
                                gouvernorate: gouvernorate,
                                modelNumber: modelNumber,
                                price: price,
                                state: state,
                                images: widget.urls,
                              ),
                            ),
                          );
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
