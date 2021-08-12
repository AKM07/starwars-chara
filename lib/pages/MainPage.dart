import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:starwars/constant/Constants.dart';
import 'package:starwars/pages/DashboardPage.dart';
import 'package:starwars/pages/FavouritePage.dart';
import 'package:starwars/pages/ProfilePage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> viewContainer = [
    DashboardPage(),
    FavouritePage(),
    ProfilePage(),
  ];

  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final navItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home), label: ""),
      BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.heart,
          ),
          label: ""),
      BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user), label: ""),
    ];

    final bottomNavigationBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: navItems,
      currentIndex: selectedTabIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Color(Constants.appMainColor),
      unselectedItemColor: Color(0xffbdbdbd),
      onTap: onTabTapped,
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: viewContainer[selectedTabIndex],
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}
