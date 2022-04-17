import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:happy_shop/Core/Shared/shared_preferences.dart';
import 'package:happy_shop/Features/Presentation/Announcement/Announcement_Screen.dart';
import 'package:happy_shop/Features/Presentation/Chat/Chat_Main_Screen.dart';
import 'package:happy_shop/Features/Presentation/Favorite/Favorite_Screen.dart';
import 'package:happy_shop/Features/Presentation/Home/Home_Screen.dart';
import 'package:happy_shop/Features/Presentation/Profile/Profile_Screen.dart';

class MainScreen extends StatefulWidget {
  final String? city;
  MainScreen({Key? key, this.city}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int _currentIndex = 0;
  late PageController _pageController;
  SharedPreferncesService _shared = SharedPreferncesService();

  Future saveUserData() async {
    User? user = _auth.currentUser;
    await _shared.saveUserData(user!.uid);
  }

  @override
  void initState() {
    saveUserData();
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              HomeScreen(
                city: widget.city,
              ),
              FavoriteScreen(),
              AnnouncementScreen(),
              ChatMainScreen(),
              ProfileScreen(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.white,
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            // Home //
            BottomNavyBarItem(
              activeColor: Color.fromRGBO(250, 244, 177, 1),
              inactiveColor: Colors.black54,
              title: Text(
                'Home',
                style: TextStyle(color: Colors.black),
              ),
              icon: Icon(
                LineAwesomeIcons.home,
                size: 30,
              ),
            ),
            // Favorite ///
            BottomNavyBarItem(
              activeColor: Color.fromRGBO(250, 244, 177, 1),
              inactiveColor: Colors.black54,
              title: Text('Favorite', style: TextStyle(color: Colors.black)),
              icon: Icon(
                LineAwesomeIcons.heart,
                color: Colors.black,
              ),
            ),

            //  Pub ///
            BottomNavyBarItem(
              activeColor: Color.fromRGBO(250, 244, 177, 1),
              inactiveColor: Colors.black54,
              title: Text('Add', style: TextStyle(color: Colors.black)),
              icon: Container(
                height: 20,
                width: 20,
                child: SvgPicture.asset("assets/icons/add.svg"),
              ),
            ),

            // Chat ///
            BottomNavyBarItem(
              activeColor: Color.fromRGBO(250, 244, 177, 1),
              inactiveColor: Colors.black54,
              title: Text('Chat', style: TextStyle(color: Colors.black)),
              icon: Container(
                height: 20,
                width: 20,
                child: SvgPicture.asset("assets/icons/messenger.svg"),
              ),
            ),

            // Compte  //
            BottomNavyBarItem(
              activeColor: Color.fromRGBO(250, 244, 177, 1),
              inactiveColor: Colors.black54,
              title: Text('Profile', style: TextStyle(color: Colors.black)),
              icon: Icon(
                LineAwesomeIcons.user,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
