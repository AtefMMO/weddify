import 'package:flutter/material.dart';
import 'package:weddify/login/user_data.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key, required this.user});
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              child: Container(
                width: 300,
                height: 300,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('UserName:'),
                    Text("${user.name}", style: const TextStyle(color: Colors.black, fontSize: 24)),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
