import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:weddify/firebase_utils.dart';
import 'package:weddify/market_screen/market_tap.dart';
import 'package:weddify/market_screen/search_cubit.dart';
import 'package:weddify/notes_screen/notes_cubit.dart';
import 'package:weddify/notes_screen/notes_tap.dart';
import 'package:weddify/offers_screen/offers_cubit.dart';
import 'package:weddify/offers_screen/offers_tap.dart';
import 'package:weddify/videos_screen/videos_tap.dart';

import 'drawer_screens/drawer.dart';
import 'videos_screen/video_cubit.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'MainScreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    UserFirebaseUtils.readUserFromDb();
    _startDelayedAction();
  }

  void _startDelayedAction() {
    Timer(Duration(seconds: 6), () {
      setState(() {
        UserFirebaseUtils.isReady = true;
      });
    });
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NotesCubit(),
          ),
          BlocProvider(
            create: (context) => OffersCubit(),
          ),
          BlocProvider(
            create: (context) => VideoCubit(),
          ),
          BlocProvider(
            create: (context) => SearchCubit(),
          )
        ],
        child: UserFirebaseUtils.isReady
            ? Scaffold(
                resizeToAvoidBottomInset: false,
                body: taps[selectedIndex],
                appBar: AppBar(
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[
                          AppTheme.orangeColor,
                          AppTheme.blueColor
                        ])),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: const Text('Weddify',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Agile',
                          fontWeight: FontWeight.bold)),
                  centerTitle: true,
                ),
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppTheme.orangeColor, AppTheme.blueColor],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      stops: [0.0, 0.8],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  child: BottomNavigationBar(
                    onTap: (value) {
                      selectedIndex = value;
                      setState(() {});
                    },
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    currentIndex: selectedIndex,
                    selectedItemColor: AppTheme.selectedItem,
                    unselectedItemColor: AppTheme.unselectedItem,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.local_offer_rounded),
                          label: 'Offers'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.note_rounded), label: 'Notes'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.video_collection), label: 'Videos'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.shop), label: 'Buy Now')
                    ],
                  ),
                ),
                drawer: Drawer(
                  child: HomeDrawer(
                    onDrawerItemClick: onDrawerItemClick,
                    user: UserFirebaseUtils.userModel!,
                  ),
                ))
            : Scaffold(
                backgroundColor: const Color(0xff474646),
                body: Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.mainColor,
                  ),
                )));
  }

  void onDrawerItemClick(int newDrawerItem) {
    Navigator.pop(context);
    setState(() {});
  }

  List<Widget> taps = [Offers(), Notes(), Videos(), Market()];
}
