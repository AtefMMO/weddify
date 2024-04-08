import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:weddify/firebase_utils.dart';
import 'package:weddify/login/user_data.dart';
import 'package:weddify/merchant_screens/add_item_screen.dart';
import 'package:weddify/merchant_screens/items_screen.dart';
import 'package:weddify/merchant_screens/settings_screen.dart';

import '../cache_helper.dart';
import '../login/login_screen.dart';

class MerchantMainScreen extends StatefulWidget {
  static const String routeName = 'MerchantMainScreen';
  final String id;

  const MerchantMainScreen({super.key, required this.id});
  @override
  State<MerchantMainScreen> createState() => _MerchantMainScreenState();
}

class _MerchantMainScreenState extends State<MerchantMainScreen> {
  late List<Widget> tapsList ;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    UserFirebaseUtils.readUserFromDb();
    _startDelayedAction();
    tapsList = [ItemsScreen(id: widget.id), const SettingsScreen()];
  }

  void _startDelayedAction() {
    Timer(Duration(seconds: 6), () {
      setState(() {
        UserFirebaseUtils.isReady = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return UserFirebaseUtils.isReady
        ? Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    CacheHelper.removeKey(key: 'uid').then((value) {
                      navigateToFinish(context, Widget widget) =>
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return widget;
                          }), (route) => false);
                      navigateToFinish(context, LogInScreen());
                    });
                  });
                },
              ),
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                selectedIndex == 0 ? 'Merchant ${UserFirebaseUtils.userModel!.name!}' : 'Settings',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              height: MediaQuery.of(context).size.height * 0.1,
              color: Colors.white,
              notchMargin: 6,
              shape: const CircularNotchedRectangle(),
              child: BottomNavigationBar(
                unselectedItemColor: AppTheme.unselectedPurble,
                selectedItemColor: AppTheme.selectedPurble,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                currentIndex: selectedIndex,
                items: [
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: 'Items'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings')
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                ShowAddTaskBottomSheet();
                //bottom sheet here
              },
              shape: const StadiumBorder(
                  side: BorderSide(color: Colors.grey, width: 4)),
              child: const Icon(
                Icons.add,
                size: 30,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: tapsList[selectedIndex],
          )
        : Scaffold(
            backgroundColor: const Color(0xff474646),
            body: InkWell(
              onTap: () async {
                await Future.delayed(Duration(seconds: 6));
                setState(() {
                  UserFirebaseUtils.isReady = true;
                });
              },
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.pink,
                ),
              ),
            ));
  }

  ShowAddTaskBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => AddItemScreen(
              id: widget.id,
            ));
  }
}
