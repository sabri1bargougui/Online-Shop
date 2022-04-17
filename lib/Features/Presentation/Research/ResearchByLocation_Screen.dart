import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Main/Main_Screen.dart';

import 'Data/data.dart';

class SearchByLocation extends StatefulWidget {
  final double height;
  SearchByLocation({Key? key, required this.height}) : super(key: key);

  @override
  _SearchByLocationState createState() => _SearchByLocationState();
}

class _SearchByLocationState extends State<SearchByLocation> {
  // late Position? position;
  late Placemark? place;
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks[0].subLocality);

    if (this.mounted) {
      setState(() {
        place = placemarks[0];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    Position position = await _getGeoLocationPosition();
    await getAddressFromLatLong(position);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _typeAheadController = TextEditingController();
    // ignore: unused_local_variable
    String? selectedCity;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () async {
              // ** search by location ** ///

              await showMaterialModalBottomSheet(
                enableDrag: false,
                isDismissible: false,
                barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  // ignore: unused_local_variable
                  double _lowerValue = 10;
                  //   double _upperValue = 300;
                  //double rayon = 0;
                  return BottomSheet(
                    enableDrag: false,
                    onClosing: () {},
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (BuildContext context, state) => Container(
                          color: Colors.transparent,
                          height: 770,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            elevation: 3,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  // *** Title *** ///
                                  Container(
                                    width: double.infinity,
                                    height: 50,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 10,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 95,
                                              right: 5,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Where are you looking?",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                SizedBox(width: 70),
                                                IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon: Icon(
                                                    Icons.close,
                                                    size: 32,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.grey[300],
                                  ),
                                  SizedBox(height: 30),
                                  Form(
                                    key: _formKey,
                                    child: Padding(
                                      padding: EdgeInsets.all(32.0),
                                      child: Column(
                                        children: <Widget>[
                                          Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            elevation: 1,
                                            shadowColor: Colors.grey,
                                            child: TypeAheadFormField(
                                              textFieldConfiguration:
                                                  TextFieldConfiguration(
                                                decoration: InputDecoration(
                                                  prefixIcon:
                                                      Icon(Icons.search),
                                                  hintText:
                                                      "Enter a city or radius ",
                                                  border: InputBorder.none,
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                                controller:
                                                    _typeAheadController,
                                              ),
                                              suggestionsCallback: (pattern) {
                                                return CitiesService
                                                    .getSuggestions(pattern);
                                              },
                                              itemBuilder:
                                                  (context, String suggestion) {
                                                return ListTile(
                                                  leading: Icon(
                                                    Icons.place,
                                                    color: Colors.black,
                                                  ),
                                                  title: Text(suggestion),
                                                );
                                              },
                                              transitionBuilder: (context,
                                                  suggestionsBox, controller) {
                                                return suggestionsBox;
                                              },
                                              onSuggestionSelected:
                                                  (String suggestion) {
                                                _typeAheadController.text =
                                                    suggestion;
                                              },
                                              validator: (value) =>
                                                  value!.isEmpty
                                                      ? 'Please select a city'
                                                      : null,
                                              onSaved: (value) =>
                                                  selectedCity = value,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 10),

                                  // *** Location *** ///
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15.0,
                                      right: 16,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                              ),
                                              width: 130,
                                              height: 30,
                                              child: Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(Icons.location_on),
                                                      Text(
                                                        (_typeAheadController
                                                                .text
                                                                .isNotEmpty)
                                                            ? "${_typeAheadController.text}"
                                                            : "${place!.locality}",
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "radius",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_up,
                                              size: 32,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),

                                  // *** RAyon *** ///
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Within a radius around",
                                              style: headline24,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "50 KM",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // *** Km Slider *** ///

                                  /*FlutterSlider(
                                    max: 700,
                                    min: 10,
                                    onDragCompleted: (
                                      handlerIndex,
                                      lowerValue,
                                      upperValue,
                                    ) {
                                      _lowerValue = lowerValue;
                                      _upperValue = upperValue;
                                    },
                                    onDragging:
                                        (handlerIndex, lowerValue, upperValue) {
                                      state(
                                        () {
                                          _lowerValue = lowerValue;
                                          _upperValue = upperValue;
                                        },
                                      );
                                    },
                                    values: [
                                      _lowerValue,
                                      _upperValue,
                                    ],
                                  ),

                                  // *** Km value *** ///
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "10 km",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                        Text(
                                          "200+ km",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), */

                                  Divider(
                                    thickness: 2,
                                    color: Colors.grey[200],
                                  ),
                                  SizedBox(height: 20),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.gps_fixed,
                                                color: Colors.black,
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                "Around me",
                                                style: headline24,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        InkWell(
                                          onTap: () {},
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'assets/icons/tunisia.png',
                                                width: 30,
                                                height: 30,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "All of Tunisia",
                                                style: headline24,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: height > 820 ? 120 : 20),

                                  // *** Validate research button *** ///

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Container(
                                        width: 310,
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: KbackgroundColor,
                                          ),
                                          onPressed: () {
                                            print(_typeAheadController.text);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MainScreen(
                                                  city:
                                                      _typeAheadController.text,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Validate Location',
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
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              width: 150,
              height: 37,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Card(
                  elevation: 0,
                  color: Colors.grey[200],
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(Icons.location_on),
                        Text(
                          "  Around me",
                          style: headline6,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Radius 50 Km",
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
