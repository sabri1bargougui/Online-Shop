import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Announcement/Motos/announcement_state&price_motos_screen.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AnnouncementInformationMotoScreen extends StatefulWidget {
  final String announcmentTitle;
  final String categorie;
  final String description;
  final List<String> urls;

  AnnouncementInformationMotoScreen({
    Key? key,
    required this.announcmentTitle,
    required this.categorie,
    required this.urls,
    required this.description,
  }) : super(key: key);

  @override
  _AnnouncementInformationMotoScreenState createState() =>
      _AnnouncementInformationMotoScreenState();
}

class _AnnouncementInformationMotoScreenState
    extends State<AnnouncementInformationMotoScreen> {
  final _color = TextEditingController();

  final _kilometrage = TextEditingController();
  final _model = TextEditingController();
  final _typemotos = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController dateCt2 = TextEditingController();
  DateTime selectedDate1 = DateTime.now();
  String? _marque;
  DateTime selectedDate2 = DateTime.now();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 50),
            Center(
              child: new Text(
                "Publish Announcment",
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
      backgroundColor: KbackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Describe your Product !',
                  style: headine20,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Text(
                'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..',
                style: headline7,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      // console Type ** ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Brand'),
                              SizedBox(height: 10),
                              Container(
                                width: 170,
                                child: DropdownSearch<String>(
                                  mode: Mode.DIALOG,
                                  showSelectedItems: true,
                                  dropdownSearchDecoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(12, 12, 0, 0),
                                    border: InputBorder.none,
                                  ),
                                  items: [
                                    "Audi",
                                    "BMW",
                                    "Citroën",
                                    'Mercedes',
                                    "Peugeot",
                                    "Renault",
                                    "Alfa Romeo",
                                    'Abarth',
                                    "Chevrolet",
                                    "Dacia",
                                    "Fiat",
                                    'Ford',
                                    'Hyundai',
                                  ],
                                  popupItemDisabled: (String s) =>
                                      s.startsWith('I'),
                                  onChanged: (value) {
                                    setState(() {
                                      _marque = value;
                                    });
                                  },
                                  selectedItem: 'Brand',
                                  showAsSuffixIcons: true,
                                  showSearchBox: true,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Model Year'),
                              SizedBox(height: 10),
                              Container(
                                width: 170,
                                height: 60,
                                child: TextFormField(
                                  controller: dateCtl,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.calendar_today,
                                      color: Colors.black,
                                    ),
                                    hintText: "Model Year",
                                  ),
                                  onTap: () async {
                                    DateTime date = DateTime(1900);
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());

                                    date = (await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate1,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100),
                                      helpText:
                                          "Sélectionnez l'Année de modéle",
                                    ))!;
                                    dateCtl.text = date.year.toString() +
                                        ' / ' +
                                        date.day.toString() +
                                        ' / ' +
                                        date.month.toString();
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Année de modéle!';
                                    }
                                    return null;
                                  },
                                  // onSaved: (value) => _date = value,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // console Type ** ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Release'),
                              SizedBox(height: 10),
                              Container(
                                width: 170,
                                height: 60,
                                child: TextFormField(
                                  controller: dateCt2,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.calendar_today,
                                      color: Colors.black,
                                    ),
                                    hintText: "Mise en circulation",
                                  ),
                                  onTap: () async {
                                    DateTime date = DateTime(1900);
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());

                                    date = (await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate2,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100),
                                      helpText:
                                          "Sélectionnez l'Année de mise en circulation",
                                    ))!;
                                    dateCt2.text = date.year.toString() +
                                        ' / ' +
                                        date.day.toString() +
                                        ' / ' +
                                        date.month.toString();
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Année de modéle!';
                                    }
                                    return null;
                                  },
                                  // onSaved: (value) => _date = value,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Mileage'),
                              SizedBox(height: 10),
                              Container(
                                width: 150,
                                height: 50,
                                child: TextFormField(
                                  controller: _kilometrage,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Mileage',
                                    hintStyle: TextStyle(fontSize: 13),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'veuillez saisir le Kilométrage';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Model'),
                              SizedBox(height: 10),
                              Container(
                                width: 150,
                                height: 50,
                                child: TextFormField(
                                  controller: _model,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: 'Model',
                                    hintStyle: TextStyle(fontSize: 13),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'veuillez saisir le modéle';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Color'),
                              SizedBox(height: 10),
                              Container(
                                width: 150,
                                height: 50,
                                child: TextFormField(
                                  controller: _color,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: 'Color',
                                    hintStyle: TextStyle(fontSize: 13),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'veuillez saisir le couleur';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Vehicle type'),
                              SizedBox(height: 10),
                              Container(
                                width: 200,
                                height: 50,
                                child: TextFormField(
                                  controller: _typemotos,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: 'Vehicle type',
                                    hintStyle: TextStyle(fontSize: 13),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'veuillez saisir le type de vehicule';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height > 820 ? 0 : 0),
            TextButton(
              onPressed: () {
                if (_marque == null) {
                  showTopSnackBar(
                    context,
                    CustomSnackBar.info(
                      backgroundColor: Colors.white,
                      message: "Veuillez remplir les champs",
                      textStyle: TextStyle(color: Colors.red),
                    ),
                  );
                } else if (_formKey.currentState!.validate()) {
                  final String categorie = widget.categorie;
                  final String announcementTitle = widget.announcmentTitle;
                  final String description = widget.description;
                  final String color = _color.text;
                  final String datemiseencircul = dateCt2.text;
                  final double kilometrage = double.parse(_kilometrage.text);
                  final String modelYear = dateCtl.text;
                  final String typeMotos = _typemotos.text;
                  final String marque = _marque!;
                  final String model = _model.text;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StateAndPriceMotosItemScreen(
                        announcementTitle: announcementTitle,
                        categorie: categorie,
                        description: description,
                        urls: widget.urls,
                        color: color,
                        datemiseencircul: datemiseencircul,
                        kilometrage: kilometrage,
                        modelYear: modelYear,
                        typemotos: typeMotos,
                        marque: marque,
                        model: model,
                      ),
                    ),
                  );
                }
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 60,
                width: 340,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
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
