import 'package:flutter/material.dart';
import 'package:weddify/init_route.dart';
import 'package:weddify/login_screen/login_screen.dart';
import 'package:weddify/login_screen/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LogInScreen.routeName,//MainScreen.routeName,
      routes: {MainScreen.routeName: (context) =>  MainScreen(),
      LogInScreen.routeName:(context)=>LogInScreen(),
      SignUpScreen.routeName:(context)=>SignUpScreen()},
      debugShowCheckedModeBanner: false,
    );
  }
}
