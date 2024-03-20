import 'package:flutter/material.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:weddify/market_screen/market_tap.dart';
import 'package:weddify/notes_screen/notes_tap.dart';
import 'package:weddify/offers_screen/offers_tap.dart';
import 'package:weddify/videos_screen/videos_tap.dart';

import 'drawer.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'MainScreen';
  final String username;

  const MainScreen({super.key, required this.username});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: taps[selectedIndex],
        appBar: AppBar(
          title: Text('Weddify', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          currentIndex: selectedIndex,
          selectedItemColor: AppTheme.selectedPurble,
          unselectedItemColor: AppTheme.unselectedPurble,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.local_offer_rounded), label: 'Offers'),
            BottomNavigationBarItem(icon: Icon(Icons.note_rounded), label: 'Notes'),
            BottomNavigationBarItem(icon: Icon(Icons.video_collection), label: 'Videos'),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Buy Now')
          ],
        ),
        drawer: Drawer(
          child: HomeDrawer(
            onDrawerItemClick: onDrawerItemClick,
            username: widget.username,
          ),
        ));
  }

  void onDrawerItemClick(int newDrawerItem) {
    Navigator.pop(context);
    setState(() {});
  }

  List<Widget> taps = [Offers(), Notes(), Videos(), Market()];
}
