import 'package:flutter/material.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:weddify/login/user_data.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key, required this.user});
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/startScreen.png',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(color: AppTheme.lightGrey, borderRadius: BorderRadius.circular(15)),
                    constraints: const BoxConstraints(minHeight: 100, minWidth: 100),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('My Profile', style: TextStyle(color: Colors.black, fontSize: 34)),
                          const SizedBox(height: 20),
                          const Icon(Icons.person, size: 50),
                          const SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(width: 5),
                                const Icon(Icons.email),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text('User Email:', style: TextStyle(color: Colors.black, fontSize: 20)),
                                      Text(
                                        '${user.email}',
                                        style: const TextStyle(color: Colors.black, fontSize: 18),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
