

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:weddify/init_route.dart';

import 'package:weddify/market_screen/market_tap.dart';
import 'package:weddify/merchant_screens/merchant_main_screen.dart';
import 'package:weddify/videos_screen/video_player.dart';

import 'firebase_options.dart';
import 'login/login_screen.dart';
import 'login/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Future.delayed(Duration(seconds: 3));
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
      ),theme:AppTheme.appTheme ,
      initialRoute: LogInScreen.routeName, //MainScreen.routeName,
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
        LogInScreen.routeName: (context) => LogInScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        VideoPlayerScreen.routeName:(context)=>VideoPlayerScreen(),
        MerchantMainScreen.routeName:(context)=>MerchantMainScreen()
      },
      debugShowCheckedModeBanner: false,
    );

  }
}
