
import 'package:flutter/material.dart';
import 'package:mad/screen/favorite_screen.dart';
import 'package:mad/screen/home_screen.dart';
import 'package:mad/screen/notification_screen.dart';
import 'package:mad/screen/profile_screen.dart';

class MainScreen  extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _State();

}

class _State extends State<MainScreen> {

  int _indexSelectedItems = 0;

  List<Widget> screensList = [
    HomeScreen(),
    FavoriteScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void _onTabChange(int index){
    setState(() {
      _indexSelectedItems = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final bottomNavBarItems = [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",backgroundColor: Colors.blue),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite",backgroundColor: Colors.blue),
      BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notification",backgroundColor: Colors.blue),
      BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Profile",backgroundColor: Colors.blue),
    ];

    final bottomNavBar = BottomNavigationBar(
        fixedColor: Colors.amber,
        items: bottomNavBarItems,
        currentIndex: _indexSelectedItems,
        onTap: _onTabChange,
      showUnselectedLabels: true,
      showSelectedLabels: true,
    );

    return Scaffold(
      body: screensList.elementAt(_indexSelectedItems),
      bottomNavigationBar: bottomNavBar,
    );
  }
}