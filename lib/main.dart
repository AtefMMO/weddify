import 'package:flutter/material.dart';
import 'package:weddify/init_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainScreen.routeName,
      routes: {MainScreen.routeName: (context) =>  MainScreen()},
      debugShowCheckedModeBanner: false,
    );
  }
}
