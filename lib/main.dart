import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weddify/init_route.dart';
import 'package:weddify/login_screen/login_screen.dart';
import 'package:weddify/login_screen/signup_screen.dart';
import 'package:weddify/market_screen/market_tap.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Market();
          }
          return LogInScreen();
        },
      ),
      initialRoute: LogInScreen.routeName, //MainScreen.routeName,
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
        LogInScreen.routeName: (context) => LogInScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
