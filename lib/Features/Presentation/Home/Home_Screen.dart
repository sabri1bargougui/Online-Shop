import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Core/Shared/shared_preferences.dart';
import 'package:happy_shop/Core/Shared/user_info.dart';
import 'package:happy_shop/Features/Domain/Products/Product_Services.dart';
import 'package:happy_shop/Features/Presentation/Category/Categories_Screen.dart';
import 'package:happy_shop/Features/Presentation/Home/Widgets/Home_Search_App_Bar.dart';
import 'package:happy_shop/Features/Presentation/Home/Widgets/Categories_homesccreen_Widget.dart';
import 'package:happy_shop/Features/Presentation/Home/Widgets/Near_You_Widget.dart';
import 'package:happy_shop/Features/Presentation/Home/Widgets/New_Announcements_Widget.dart';
import 'package:happy_shop/Features/Presentation/Research/ResearchByLocation_Screen.dart';
import 'package:happy_shop/Features/Widgets/Empty_Widget.dart';

class HomeScreen extends StatefulWidget {
  final String? city;
  HomeScreen({Key? key, this.city}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position? _currentPosition;
  String? _currentAddress;
  _getCurrentLocation() async {
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        forceAndroidLocationManager: true);
    List<Placemark> p = await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude);
    Placemark place = p[0];
    if (this.mounted) {
      setState(() {
        if (place.locality != null) {
          _currentAddress = place.locality.toString();
        } else
          setState(() {
            _currentAddress = null;
          });
      });
    }
  }

  Future getUserInfo() async {
    UserInfoData.username = (await SharedPreferncesService.getuserName());
    UserInfoData.userLastName =
        (await SharedPreferncesService.getuserLastName());
    UserInfoData.userEmail = (await SharedPreferncesService.getuserEmail());
    UserInfoData.userDate = (await SharedPreferncesService.getUserDate());
    UserInfoData.userID = (await SharedPreferncesService.getuserID());
    UserInfoData.userAvatarUrl = (await SharedPreferncesService.getUserImage());
    UserInfoData.userPhoneNumber =
        (await SharedPreferncesService.getuserPhone());
  }

  @override
  void initState() {
    _getCurrentLocation();

    super.initState();
    getUserInfo();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  ProductServices _productServices = ProductServices();
  // late Position? position;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0.0,
        automaticallyImplyLeading: false,
        toolbarHeight: 100, // Set this height
        flexibleSpace: HomeSearchAppBar(),
      ),
      body: SingleChildScrollView(
        child: (UserInfoData.userID == null)
            ? Padding(
                padding: const EdgeInsets.all(50),
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                )),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  // Rayon + Autor de moi //
                  SearchByLocation(height: height),

                  ///
                  SizedBox(height: 20),

                  // *******  Categories ******** //
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Top Categories',
                              style: headline21,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoriesScreen(),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "More",
                                    style: TextStyle(color: Color(0xFFBBBBBB)),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right_sharp,
                                    size: 30,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CategoryWidget(
                                firstname: "Techno ",
                                secondename: "Multimedia",
                                imageasset: "assets/icons/fi-rr-screen.png",
                              ),
                              CategoryWidget(
                                firstname: "Cars ",
                                secondename: "Motors",
                                imageasset: "assets/icons/fi-rr-dashboard.png",
                              ),
                              CategoryWidget(
                                firstname: "Entertainment",
                                secondename: "Leisure",
                                imageasset: "assets/icons/video.svg",
                              ),
                              CategoryWidget(
                                firstname: "Job",
                                secondename: "Services",
                                imageasset: "assets/icons/job-seeker.svg",
                              ),
                              CategoryWidget(
                                firstname: "Clothing ",
                                secondename: "Welfare",
                                imageasset: "assets/icons/shirt.svg",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  // new Product ///
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'New annonces',
                              style: headine20,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 15),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            StreamBuilder<QuerySnapshot>(
                              stream: _productServices.getNewAnnounces(),
                              builder: (context, snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.yellow,
                                      ),
                                    );
                                  default:
                                    if (snapshot.hasError) {
                                      return Center(
                                        child: Container(
                                          width: 100,
                                          height: 70,
                                          child: EmptyWidgetScreen(
                                            subtitle: 'probleme',
                                            title: 'probleme',
                                          ),
                                        ),
                                      );
                                    } else {
                                      List<DocumentSnapshot> announce =
                                          snapshot.data!.docs;
                                      if (announce.isEmpty) {
                                        return Center(
                                          child: Container(
                                            width: 300,
                                            height: 200,
                                            child: EmptyWidgetScreen(
                                              title: 'Aucune annonce trouvée',
                                              subtitle: 'Ajouter une annonce',
                                              fontsizeSubTitle: 10,
                                              fontsizetitle: 15,
                                            ),
                                          ),
                                        );
                                      } else
                                        return SizedBox(
                                          height: 200,
                                          width: width,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 16),
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              primary: false,
                                              itemCount: announce.length,
                                              itemBuilder: (context, index) {
                                                if (announce[index]
                                                        ['categorie'] ==
                                                    'Informatique') {
                                                  return NewAnnouncements(
                                                    idAnnounce: announce[index]
                                                        ['ID_Announce'],
                                                    categorie: announce[index]
                                                        ['categorie'],
                                                    announceID: announce[index]
                                                        ['announce_ID'],
                                                    announceTitle:
                                                        announce[index]
                                                            ['announce_Title'],
                                                    createdAt: announce[index]
                                                        ['CreatedAt'],
                                                    description: announce[index]
                                                        ['description'],
                                                    images: announce[index]
                                                        ['images'],
                                                    delegation: announce[index]
                                                        ['delegation'],
                                                    governorate: announce[index]
                                                        ['governorate'],
                                                    price: announce[index]
                                                        ['announce_Price'],
                                                    condition: announce[index]
                                                        ['condition'],
                                                    sellerAvatar:
                                                        announce[index]
                                                                ['Seller']
                                                            ['Image_Vendeur'],
                                                    sellerDate: announce[index]
                                                            ['Seller']
                                                        ['Date_Vendeur'],
                                                    sellerID: announce[index]
                                                            ['Seller']
                                                        ['Vendeur_ID'],
                                                    sellerName: announce[index]
                                                            ['Seller']
                                                        ['Nom_Vendeur'],
                                                    sellerPhone: announce[index]
                                                            ['Seller']
                                                        ['Numéro_Vendeur'],
                                                    sellerRank: announce[index]
                                                            ['Seller']
                                                        ['Rank_Vendeur'],
                                                    consoleType: announce[index]
                                                            ['details']
                                                        ['Type_Console'],
                                                    garenti: announce[index]
                                                        ['details']['Garanti'],
                                                    garentiType: announce[index]
                                                            ['details']
                                                        ['Type_Garanti'],
                                                    genericName: announce[index]
                                                            ['details']
                                                        ['Nom_Generique'],
                                                    modelNumber: announce[index]
                                                            ['details']
                                                        ['Numéro_Modele'],
                                                  );
                                                } else if (announce[index]
                                                        ['categorie'] ==
                                                    'Voitures')
                                                  return NewAnnouncements(
                                                    idAnnounce: announce[index]
                                                        ['ID_Announce'],
                                                    categorie: announce[index]
                                                        ['categorie'],
                                                    announceID: announce[index]
                                                        ['announce_ID'],
                                                    announceTitle:
                                                        announce[index]
                                                            ['announce_Title'],
                                                    createdAt: announce[index]
                                                        ['CreatedAt'],
                                                    description: announce[index]
                                                        ['description'],
                                                    images: announce[index]
                                                        ['images'],
                                                    delegation: announce[index]
                                                        ['delegation'],
                                                    governorate: announce[index]
                                                        ['governorate'],
                                                    price: announce[index]
                                                        ['announce_Price'],
                                                    condition: announce[index]
                                                        ['condition'],
                                                    sellerAvatar:
                                                        announce[index]
                                                                ['Seller']
                                                            ['Image_Vendeur'],
                                                    sellerDate: announce[index]
                                                            ['Seller']
                                                        ['Date_Vendeur'],
                                                    sellerID: announce[index]
                                                            ['Seller']
                                                        ['Vendeur_ID'],
                                                    sellerName: announce[index]
                                                            ['Seller']
                                                        ['Nom_Vendeur'],
                                                    sellerPhone: announce[index]
                                                            ['Seller']
                                                        ['Numéro_Vendeur'],
                                                    sellerRank: announce[index]
                                                            ['Seller']
                                                        ['Rank_Vendeur'],
                                                    carburant: announce[index]
                                                            ['details']
                                                        ['carburant'],
                                                    color: announce[index]
                                                        ['details']['color'],
                                                    model: announce[index]
                                                        ['details']['Model'],
                                                    nombrePlaces:
                                                        announce[index]
                                                                ['details']
                                                            ['nbr_places'],
                                                    nombrePorte: announce[index]
                                                            ['details']
                                                        ['nbr_portes'],
                                                    puissanceFiscale:
                                                        announce[index]
                                                                ['details']
                                                            ['puiss_fiscale'],
                                                    puissanceDin:
                                                        announce[index]
                                                                ['details']
                                                            ['puiss_din'],
                                                    kilometrage: announce[index]
                                                            ['details']
                                                        ['kilometrage'],
                                                    modelYear: announce[index]
                                                            ['details']
                                                        ['annee_modele'],
                                                    datemiseencircul: announce[
                                                            index]['details']
                                                        ['date_mise_en_circu'],
                                                    typeCar: announce[index]
                                                            ['details']
                                                        ['type_vehicule'],
                                                    marque: announce[index]
                                                        ['details']['marque'],
                                                  );
                                                else if (announce[index]
                                                        ['categorie'] ==
                                                    'Motos') {
                                                  return NewAnnouncements(
                                                    idAnnounce: announce[index]
                                                        ['ID_Announce'],
                                                    categorie: announce[index]
                                                        ['categorie'],
                                                    announceID: announce[index]
                                                        ['announce_ID'],
                                                    announceTitle:
                                                        announce[index]
                                                            ['announce_Title'],
                                                    createdAt: announce[index]
                                                        ['CreatedAt'],
                                                    description: announce[index]
                                                        ['description'],
                                                    images: announce[index]
                                                        ['images'],
                                                    delegation: announce[index]
                                                        ['delegation'],
                                                    governorate: announce[index]
                                                        ['governorate'],
                                                    price: announce[index]
                                                        ['announce_Price'],
                                                    condition: announce[index]
                                                        ['condition'],
                                                    sellerAvatar:
                                                        announce[index]
                                                                ['Seller']
                                                            ['Image_Vendeur'],
                                                    sellerDate: announce[index]
                                                            ['Seller']
                                                        ['Date_Vendeur'],
                                                    sellerID: announce[index]
                                                            ['Seller']
                                                        ['Vendeur_ID'],
                                                    sellerName: announce[index]
                                                            ['Seller']
                                                        ['Nom_Vendeur'],
                                                    sellerPhone: announce[index]
                                                            ['Seller']
                                                        ['Numéro_Vendeur'],
                                                    sellerRank: announce[index]
                                                            ['Seller']
                                                        ['Rank_Vendeur'],
                                                    color: announce[index]
                                                        ['details']['color'],
                                                    model: announce[index]
                                                        ['details']['Model'],
                                                    kilometrage: announce[index]
                                                            ['details']
                                                        ['kilometrage'],
                                                    modelYear: announce[index]
                                                            ['details']
                                                        ['annee_modele'],
                                                    datemiseencircul: announce[
                                                            index]['details']
                                                        ['date_mise_en_circu'],
                                                    typeMotos: announce[index]
                                                            ['details']
                                                        ['type_vehicule'],
                                                    marque: announce[index]
                                                        ['details']['marque'],
                                                  );
                                                } else if (announce[index]
                                                        ['categorie'] ==
                                                    'Multimédia') {
                                                  return NewAnnouncements(
                                                    idAnnounce: announce[index]
                                                        ['ID_Announce'],
                                                    categorie: announce[index]
                                                        ['categorie'],
                                                    announceID: announce[index]
                                                        ['announce_ID'],
                                                    announceTitle:
                                                        announce[index]
                                                            ['announce_Title'],
                                                    createdAt: announce[index]
                                                        ['CreatedAt'],
                                                    description: announce[index]
                                                        ['description'],
                                                    images: announce[index]
                                                        ['images'],
                                                    delegation: announce[index]
                                                        ['delegation'],
                                                    governorate: announce[index]
                                                        ['governorate'],
                                                    price: announce[index]
                                                        ['announce_Price'],
                                                    condition: announce[index]
                                                        ['condition'],
                                                    sellerAvatar:
                                                        announce[index]
                                                                ['Seller']
                                                            ['Image_Vendeur'],
                                                    sellerDate: announce[index]
                                                            ['Seller']
                                                        ['Date_Vendeur'],
                                                    sellerID: announce[index]
                                                            ['Seller']
                                                        ['Vendeur_ID'],
                                                    sellerName: announce[index]
                                                            ['Seller']
                                                        ['Nom_Vendeur'],
                                                    sellerPhone: announce[index]
                                                            ['Seller']
                                                        ['Numéro_Vendeur'],
                                                    sellerRank: announce[index]
                                                            ['Seller']
                                                        ['Rank_Vendeur'],
                                                    model: announce[index]
                                                        ['details']['Model'],
                                                    marque: announce[index]
                                                        ['details']['marque'],
                                                    modelNumber: announce[index]
                                                            ['details']
                                                        ['Numéro_Modele'],
                                                    genericName: announce[index]
                                                            ['details']
                                                        ['Nom_Generique'],
                                                  );
                                                } else if (announce[index]
                                                        ['categorie'] ==
                                                    'Immobilier') {
                                                  return NewAnnouncements(
                                                    idAnnounce: announce[index]
                                                        ['ID_Announce'],
                                                    categorie: announce[index]
                                                        ['categorie'],
                                                    announceID: announce[index]
                                                        ['announce_ID'],
                                                    announceTitle:
                                                        announce[index]
                                                            ['announce_Title'],
                                                    createdAt: announce[index]
                                                        ['CreatedAt'],
                                                    description: announce[index]
                                                        ['description'],
                                                    images: announce[index]
                                                        ['images'],
                                                    delegation: announce[index]
                                                        ['delegation'],
                                                    governorate: announce[index]
                                                        ['governorate'],
                                                    price: announce[index]
                                                        ['announce_Price'],
                                                    condition: announce[index]
                                                        ['condition'],
                                                    sellerAvatar:
                                                        announce[index]
                                                                ['Seller']
                                                            ['Image_Vendeur'],
                                                    sellerDate: announce[index]
                                                            ['Seller']
                                                        ['Date_Vendeur'],
                                                    sellerID: announce[index]
                                                            ['Seller']
                                                        ['Vendeur_ID'],
                                                    sellerName: announce[index]
                                                            ['Seller']
                                                        ['Nom_Vendeur'],
                                                    sellerPhone: announce[index]
                                                            ['Seller']
                                                        ['Numéro_Vendeur'],
                                                    sellerRank: announce[index]
                                                            ['Seller']
                                                        ['Rank_Vendeur'],
                                                    surface: announce[index]
                                                        ['details']['surface'],
                                                    roomNumber: announce[index]
                                                            ['details']
                                                        ['nb_Chambre'],
                                                    terrain: announce[index]
                                                        ['details']['terrain'],
                                                  );
                                                } else if (announce[index]
                                                        ['categorie'] ==
                                                    'Autres') {
                                                  return NewAnnouncements(
                                                    idAnnounce: announce[index]
                                                        ['ID_Announce'],
                                                    categorie: announce[index]
                                                        ['categorie'],
                                                    announceID: announce[index]
                                                        ['announce_ID'],
                                                    announceTitle:
                                                        announce[index]
                                                            ['announce_Title'],
                                                    createdAt: announce[index]
                                                        ['CreatedAt'],
                                                    description: announce[index]
                                                        ['description'],
                                                    images: announce[index]
                                                        ['images'],
                                                    delegation: announce[index]
                                                        ['delegation'],
                                                    governorate: announce[index]
                                                        ['governorate'],
                                                    price: announce[index]
                                                        ['announce_Price'],
                                                    condition: announce[index]
                                                        ['condition'],
                                                    sellerAvatar:
                                                        announce[index]
                                                                ['Seller']
                                                            ['Image_Vendeur'],
                                                    sellerDate: announce[index]
                                                            ['Seller']
                                                        ['Date_Vendeur'],
                                                    sellerID: announce[index]
                                                            ['Seller']
                                                        ['Vendeur_ID'],
                                                    sellerName: announce[index]
                                                            ['Seller']
                                                        ['Nom_Vendeur'],
                                                    sellerPhone: announce[index]
                                                            ['Seller']
                                                        ['Numéro_Vendeur'],
                                                    sellerRank: announce[index]
                                                            ['Seller']
                                                        ['Rank_Vendeur'],
                                                    model: announce[index]
                                                        ['details']['Model'],
                                                    marque: announce[index]
                                                        ['details']['marque'],
                                                    modelNumber: announce[index]
                                                            ['details']
                                                        ['Numéro_Modele'],
                                                    genericName: announce[index]
                                                            ['details']
                                                        ['Nom_Generique'],
                                                  );
                                                } else if (announce[index]
                                                        ['categorie'] ==
                                                    'Immobilier') {
                                                  return NewAnnouncements(
                                                    idAnnounce: announce[index]
                                                        ['ID_Announce'],
                                                    categorie: announce[index]
                                                        ['categorie'],
                                                    announceID: announce[index]
                                                        ['announce_ID'],
                                                    announceTitle:
                                                        announce[index]
                                                            ['announce_Title'],
                                                    createdAt: announce[index]
                                                        ['CreatedAt'],
                                                    description: announce[index]
                                                        ['description'],
                                                    images: announce[index]
                                                        ['images'],
                                                    delegation: announce[index]
                                                        ['delegation'],
                                                    governorate: announce[index]
                                                        ['governorate'],
                                                    price: announce[index]
                                                        ['announce_Price'],
                                                    condition: announce[index]
                                                        ['condition'],
                                                    sellerAvatar:
                                                        announce[index]
                                                                ['Seller']
                                                            ['Image_Vendeur'],
                                                    sellerDate: announce[index]
                                                            ['Seller']
                                                        ['Date_Vendeur'],
                                                    sellerID: announce[index]
                                                            ['Seller']
                                                        ['Vendeur_ID'],
                                                    sellerName: announce[index]
                                                            ['Seller']
                                                        ['Nom_Vendeur'],
                                                    sellerPhone: announce[index]
                                                            ['Seller']
                                                        ['Numéro_Vendeur'],
                                                    sellerRank: announce[index]
                                                            ['Seller']
                                                        ['Rank_Vendeur'],
                                                  );
                                                }
                                                return Container();
                                              },
                                            ),
                                          ),
                                        );
                                    }
                                }
                              },
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      // ******  Near You ********* //
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Close to you',
                              style: headine20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  StreamBuilder<QuerySnapshot>(
                    stream: (_currentAddress != null && widget.city == null)
                        ? _productServices
                            .getAnnouncesNearUser(_currentAddress!)
                        : (widget.city != null && _currentAddress != null)
                            ? _productServices
                                .getAnnouncesNearUser(widget.city!)
                            : _productServices.getNewAnnounces(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                              child: CircularProgressIndicator(
                            color: Colors.yellow,
                          ));
                        default:
                          if (snapshot.hasError) {
                            return EmptyWidgetScreen(
                              subtitle: 'probleme',
                              title: 'probleme',
                            );
                          } else {
                            List<DocumentSnapshot> announce =
                                snapshot.data!.docs;
                            if (announce.isEmpty) {
                              return EmptyWidgetScreen(
                                  title: 'No announce found',
                                  subtitle: 'Add an anounce');
                            } else
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: height < 600 ? 0.4 : 0.5,
                                    crossAxisSpacing: 2,
                                  ),
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: announce.length,
                                  itemBuilder: (context, index) {
                                    if (announce[index]['categorie'] ==
                                        'Informatique') {
                                      return NearYouWidget(
                                        idAnnounce: announce[index]
                                            ['ID_Announce'],
                                        categorie: announce[index]['categorie'],
                                        announceID: announce[index]
                                            ['announce_ID'],
                                        announceTitle: announce[index]
                                            ['announce_Title'],
                                        createdAt: announce[index]['CreatedAt'],
                                        description: announce[index]
                                            ['description'],
                                        images: announce[index]['images'],
                                        delegation: announce[index]
                                            ['delegation'],
                                        governorate: announce[index]
                                            ['governorate'],
                                        price: announce[index]
                                            ['announce_Price'],
                                        condition: announce[index]['condition'],
                                        sellerAvatar: announce[index]['Seller']
                                            ['Image_Vendeur'],
                                        sellerDate: announce[index]['Seller']
                                            ['Date_Vendeur'],
                                        sellerID: announce[index]['Seller']
                                            ['Vendeur_ID'],
                                        sellerName: announce[index]['Seller']
                                            ['Nom_Vendeur'],
                                        sellerPhone: announce[index]['Seller']
                                            ['Numéro_Vendeur'],
                                        sellerRank: announce[index]['Seller']
                                            ['Rank_Vendeur'],
                                        consoleType: announce[index]['details']
                                            ['Type_Console'],
                                        garenti: announce[index]['details']
                                            ['Garanti'],
                                        garentiType: announce[index]['details']
                                            ['Type_Garanti'],
                                        genericName: announce[index]['details']
                                            ['Nom_Generique'],
                                        modelNumber: announce[index]['details']
                                            ['Numéro_Modele'],
                                      );
                                    } else if (announce[index]['categorie'] ==
                                        'Voitures')
                                      return NearYouWidget(
                                        idAnnounce: announce[index]
                                            ['ID_Announce'],
                                        categorie: announce[index]['categorie'],
                                        announceID: announce[index]
                                            ['announce_ID'],
                                        announceTitle: announce[index]
                                            ['announce_Title'],
                                        createdAt: announce[index]['CreatedAt'],
                                        description: announce[index]
                                            ['description'],
                                        images: announce[index]['images'],
                                        delegation: announce[index]
                                            ['delegation'],
                                        governorate: announce[index]
                                            ['governorate'],
                                        price: announce[index]
                                            ['announce_Price'],
                                        condition: announce[index]['condition'],
                                        sellerAvatar: announce[index]['Seller']
                                            ['Image_Vendeur'],
                                        sellerDate: announce[index]['Seller']
                                            ['Date_Vendeur'],
                                        sellerID: announce[index]['Seller']
                                            ['Vendeur_ID'],
                                        sellerName: announce[index]['Seller']
                                            ['Nom_Vendeur'],
                                        sellerPhone: announce[index]['Seller']
                                            ['Numéro_Vendeur'],
                                        sellerRank: announce[index]['Seller']
                                            ['Rank_Vendeur'],
                                        carburant: announce[index]['details']
                                            ['carburant'],
                                        color: announce[index]['details']
                                            ['color'],
                                        model: announce[index]['details']
                                            ['Model'],
                                        nombrePlaces: announce[index]['details']
                                            ['nbr_places'],
                                        nombrePorte: announce[index]['details']
                                            ['nbr_portes'],
                                        puissanceFiscale: announce[index]
                                            ['details']['puiss_fiscale'],
                                        puissanceDin: announce[index]['details']
                                            ['puiss_din'],
                                        kilometrage: announce[index]['details']
                                            ['kilometrage'],
                                        modelYear: announce[index]['details']
                                            ['annee_modele'],
                                        datemiseencircul: announce[index]
                                            ['details']['date_mise_en_circu'],
                                        typeCar: announce[index]['details']
                                            ['type_vehicule'],
                                        marque: announce[index]['details']
                                            ['marque'],
                                      );
                                    else if (announce[index]['categorie'] ==
                                        'Motos') {
                                      return NearYouWidget(
                                        idAnnounce: announce[index]
                                            ['ID_Announce'],
                                        categorie: announce[index]['categorie'],
                                        announceID: announce[index]
                                            ['announce_ID'],
                                        announceTitle: announce[index]
                                            ['announce_Title'],
                                        createdAt: announce[index]['CreatedAt'],
                                        description: announce[index]
                                            ['description'],
                                        images: announce[index]['images'],
                                        delegation: announce[index]
                                            ['delegation'],
                                        governorate: announce[index]
                                            ['governorate'],
                                        price: announce[index]
                                            ['announce_Price'],
                                        condition: announce[index]['condition'],
                                        sellerAvatar: announce[index]['Seller']
                                            ['Image_Vendeur'],
                                        sellerDate: announce[index]['Seller']
                                            ['Date_Vendeur'],
                                        sellerID: announce[index]['Seller']
                                            ['Vendeur_ID'],
                                        sellerName: announce[index]['Seller']
                                            ['Nom_Vendeur'],
                                        sellerPhone: announce[index]['Seller']
                                            ['Numéro_Vendeur'],
                                        sellerRank: announce[index]['Seller']
                                            ['Rank_Vendeur'],
                                        color: announce[index]['details']
                                            ['color'],
                                        model: announce[index]['details']
                                            ['Model'],
                                        kilometrage: announce[index]['details']
                                            ['kilometrage'],
                                        modelYear: announce[index]['details']
                                            ['annee_modele'],
                                        datemiseencircul: announce[index]
                                            ['details']['date_mise_en_circu'],
                                        typeMotos: announce[index]['details']
                                            ['type_vehicule'],
                                        marque: announce[index]['details']
                                            ['marque'],
                                      );
                                    } else if (announce[index]['categorie'] ==
                                        'Multimédia') {
                                      return NearYouWidget(
                                        idAnnounce: announce[index]
                                            ['ID_Announce'],
                                        categorie: announce[index]['categorie'],
                                        announceID: announce[index]
                                            ['announce_ID'],
                                        announceTitle: announce[index]
                                            ['announce_Title'],
                                        createdAt: announce[index]['CreatedAt'],
                                        description: announce[index]
                                            ['description'],
                                        images: announce[index]['images'],
                                        delegation: announce[index]
                                            ['delegation'],
                                        governorate: announce[index]
                                            ['governorate'],
                                        price: announce[index]
                                            ['announce_Price'],
                                        condition: announce[index]['condition'],
                                        sellerAvatar: announce[index]['Seller']
                                            ['Image_Vendeur'],
                                        sellerDate: announce[index]['Seller']
                                            ['Date_Vendeur'],
                                        sellerID: announce[index]['Seller']
                                            ['Vendeur_ID'],
                                        sellerName: announce[index]['Seller']
                                            ['Nom_Vendeur'],
                                        sellerPhone: announce[index]['Seller']
                                            ['Numéro_Vendeur'],
                                        sellerRank: announce[index]['Seller']
                                            ['Rank_Vendeur'],
                                        model: announce[index]['details']
                                            ['Model'],
                                        marque: announce[index]['details']
                                            ['marque'],
                                        modelNumber: announce[index]['details']
                                            ['Numéro_Modele'],
                                        genericName: announce[index]['details']
                                            ['Nom_Generique'],
                                      );
                                    } else if (announce[index]['categorie'] ==
                                        'Immobilier') {
                                      return NearYouWidget(
                                        idAnnounce: announce[index]
                                            ['ID_Announce'],
                                        categorie: announce[index]['categorie'],
                                        announceID: announce[index]
                                            ['announce_ID'],
                                        announceTitle: announce[index]
                                            ['announce_Title'],
                                        createdAt: announce[index]['CreatedAt'],
                                        description: announce[index]
                                            ['description'],
                                        images: announce[index]['images'],
                                        delegation: announce[index]
                                            ['delegation'],
                                        governorate: announce[index]
                                            ['governorate'],
                                        price: announce[index]
                                            ['announce_Price'],
                                        condition: announce[index]['condition'],
                                        sellerAvatar: announce[index]['Seller']
                                            ['Image_Vendeur'],
                                        sellerDate: announce[index]['Seller']
                                            ['Date_Vendeur'],
                                        sellerID: announce[index]['Seller']
                                            ['Vendeur_ID'],
                                        sellerName: announce[index]['Seller']
                                            ['Nom_Vendeur'],
                                        sellerPhone: announce[index]['Seller']
                                            ['Numéro_Vendeur'],
                                        sellerRank: announce[index]['Seller']
                                            ['Rank_Vendeur'],
                                        surface: announce[index]['details']
                                            ['surface'],
                                        roomNumber: announce[index]['details']
                                            ['nb_Chambre'],
                                        terrain: announce[index]['details']
                                            ['terrain'],
                                      );
                                    } else if (announce[index]['categorie'] ==
                                        'Autres') {
                                      return NearYouWidget(
                                        idAnnounce: announce[index]
                                            ['ID_Announce'],
                                        categorie: announce[index]['categorie'],
                                        announceID: announce[index]
                                            ['announce_ID'],
                                        announceTitle: announce[index]
                                            ['announce_Title'],
                                        createdAt: announce[index]['CreatedAt'],
                                        description: announce[index]
                                            ['description'],
                                        images: announce[index]['images'],
                                        delegation: announce[index]
                                            ['delegation'],
                                        governorate: announce[index]
                                            ['governorate'],
                                        price: announce[index]
                                            ['announce_Price'],
                                        condition: announce[index]['condition'],
                                        sellerAvatar: announce[index]['Seller']
                                            ['Image_Vendeur'],
                                        sellerDate: announce[index]['Seller']
                                            ['Date_Vendeur'],
                                        sellerID: announce[index]['Seller']
                                            ['Vendeur_ID'],
                                        sellerName: announce[index]['Seller']
                                            ['Nom_Vendeur'],
                                        sellerPhone: announce[index]['Seller']
                                            ['Numéro_Vendeur'],
                                        sellerRank: announce[index]['Seller']
                                            ['Rank_Vendeur'],
                                        model: announce[index]['details']
                                            ['Model'],
                                        marque: announce[index]['details']
                                            ['marque'],
                                        modelNumber: announce[index]['details']
                                            ['Numéro_Modele'],
                                        genericName: announce[index]['details']
                                            ['Nom_Generique'],
                                      );
                                    } else if (announce[index]['categorie'] ==
                                        'Immobilier') {
                                      return NearYouWidget(
                                        idAnnounce: announce[index]
                                            ['ID_Announce'],
                                        categorie: announce[index]['categorie'],
                                        announceID: announce[index]
                                            ['announce_ID'],
                                        announceTitle: announce[index]
                                            ['announce_Title'],
                                        createdAt: announce[index]['CreatedAt'],
                                        description: announce[index]
                                            ['description'],
                                        images: announce[index]['images'],
                                        delegation: announce[index]
                                            ['delegation'],
                                        governorate: announce[index]
                                            ['governorate'],
                                        price: announce[index]
                                            ['announce_Price'],
                                        condition: announce[index]['condition'],
                                        sellerAvatar: announce[index]['Seller']
                                            ['Image_Vendeur'],
                                        sellerDate: announce[index]['Seller']
                                            ['Date_Vendeur'],
                                        sellerID: announce[index]['Seller']
                                            ['Vendeur_ID'],
                                        sellerName: announce[index]['Seller']
                                            ['Nom_Vendeur'],
                                        sellerPhone: announce[index]['Seller']
                                            ['Numéro_Vendeur'],
                                        sellerRank: announce[index]['Seller']
                                            ['Rank_Vendeur'],
                                      );
                                    }
                                    return Container();
                                  },
                                ),
                              );
                          }
                      }
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
