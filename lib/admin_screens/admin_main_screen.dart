import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weddify/admin_screens/admin_taps/notes/notes_admin.dart';
import 'package:weddify/admin_screens/admin_taps/offers/offers_admin.dart';
import 'package:weddify/admin_screens/admin_taps/videos/videos_admin.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:weddify/cache_helper.dart';
import 'package:weddify/firebase_utils.dart';
import 'package:weddify/login/login_screen.dart';

class MainScreenAdmin extends StatefulWidget {
  static const String routeName = 'MainScreenAdmin';

  @override
  State<MainScreenAdmin> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreenAdmin> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    UserFirebaseUtils.readUserFromDb();
    print(UserFirebaseUtils.isReady);
  }

  @override
  Widget build(BuildContext context) {
    return UserFirebaseUtils.isReady
        ? Scaffold(
            resizeToAvoidBottomInset: false,
            body: taps[selectedIndex],
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
                title: Text('Admin', style: TextStyle(color: Colors.black)),
                backgroundColor: Colors.pink,
                centerTitle: true),
            bottomNavigationBar: BottomNavigationBar(backgroundColor:AppTheme.mainColor ,
              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },
              currentIndex: selectedIndex,
              selectedItemColor: AppTheme.selectedItem,
              unselectedItemColor: AppTheme.unselectedItem,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.local_offer_rounded), label: 'Offers'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.note_rounded), label: 'Notes'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.video_collection), label: 'Videos'),
              ],
            ))
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

  void onDrawerItemClick(int newDrawerItem) {
    Navigator.pop(context);
    setState(() {});
  }

  List<Widget> taps = [OffersAdmin(), NotesAdmin(), VideosAdmin()];
}
