import 'package:flutter/material.dart';
import 'package:weddify/admin_screens/admin_taps/notes/notes_admin.dart';
import 'package:weddify/admin_screens/admin_taps/offers/offers_admin.dart';
import 'package:weddify/admin_screens/admin_taps/videos/videos_admin.dart';
import 'package:weddify/app_theme/app_theme.dart';

class MainScreenAdmin extends StatefulWidget {
  static const String routeName = 'MainScreenAdmin';

  @override
  State<MainScreenAdmin> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreenAdmin> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: taps[selectedIndex],
        appBar: AppBar(
            title: Text('Admin', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.pink,
            centerTitle: true),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          currentIndex: selectedIndex,
          selectedItemColor: AppTheme.selectedPurble,
          unselectedItemColor: AppTheme.unselectedPurble,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.local_offer_rounded), label: 'Offers'),
            BottomNavigationBarItem(
                icon: Icon(Icons.note_rounded), label: 'Notes'),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_collection), label: 'Videos'),
          ],
        ));
  }

  void onDrawerItemClick(int newDrawerItem) {
    Navigator.pop(context);
    setState(() {});
  }

  List<Widget> taps = [OffersAdmin(), NotesAdmin(), VideosAdmin()];
}
