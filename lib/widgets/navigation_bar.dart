import 'package:flutter/material.dart';
import 'package:mr_battery/screens/cart_screen.dart';
import 'package:mr_battery/screens/category_screen.dart';
import 'package:mr_battery/screens/home_screen.dart';
import 'package:mr_battery/screens/profile_screen.dart';
import 'package:mr_battery/services/utils/my_theme.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  int _selectedIndex = 0;
  static List<Widget> _mainScreens = <Widget>[
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _mainScreens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MyTheme.primaryColor,
        showSelectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
