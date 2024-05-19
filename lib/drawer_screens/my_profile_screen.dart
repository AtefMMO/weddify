import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:weddify/cache_helper.dart';
import 'package:weddify/login/login_screen.dart';
import 'package:weddify/login/user_data.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key, required this.user});
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('Weddify'),
        centerTitle: true,
      ),
      body: Stack(
        children: [

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    color: AppTheme.lightGrey,
                    borderRadius: BorderRadius.circular(15)),
                constraints:
                    const BoxConstraints(minHeight: 100, minWidth: 100),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('My Profile',
                          style: TextStyle(color: Colors.black, fontSize: 34)),
                      const SizedBox(height: 20),
                      const Icon(Icons.person, size: 50),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 5),
                            const Icon(Icons.email),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text('User Email:',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${user.email}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 5),
                            const Icon(Icons.person_pin_circle_rounded),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text('User Name:',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${user.name}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 5),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text('User Id:',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${user.id}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 5),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text('User Status:',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: user.isMerchant!
                                        ? Text(
                                            '${'Merchant'}',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          )
                                        : user.isAdmin!
                                            ? Text(
                                                '${'Admin'}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              )
                                            : Text(
                                                '${'User'}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut().then((value) {
                                CacheHelper.removeKey(key: 'uid').then((value) {
                                  navigateToFinish(context,Widget widget)=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                                    return widget;
                                  }), (route) => false);
                                  navigateToFinish(context, LogInScreen());
                                });
                              });
                            },
                            child: const Text(
                              '\t \tlog out\t \t',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.orangeColor),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
