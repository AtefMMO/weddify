import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weddify/admin_screens/admin_main_screen.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:weddify/cache_helper.dart';
import 'package:weddify/init_route.dart';
import 'package:weddify/login/user_data.dart';
import 'package:weddify/market_screen/market_tap.dart';
import 'package:weddify/merchant_screens/merchant_main_screen.dart';
import 'package:weddify/videos_screen/video_player.dart';
import 'constants.dart';
import 'firebase_options.dart';
import 'login/login_screen.dart';
import 'login/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  uid = CacheHelper.getData(key: 'uid');
  isAdmin = CacheHelper.getData(key: 'isAdmin');
  isMerchant = CacheHelper.getData(key: 'isMerchant');

  Widget? widget;
  if (uid == null) {
    widget = LogInScreen();
  } else {
    if (isAdmin ?? false) {
      widget = MainScreenAdmin();
    } else if (isMerchant ?? false) {
      widget = MerchantMainScreen(id: uid!);
    } else {
      widget = MainScreen();
    }

  }
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Future.delayed(Duration(seconds: 3));
  runApp(MyApp(
    startScreen: widget,
  ));
}

class MyApp extends StatelessWidget {
  Widget? startScreen;

  MyApp({super.key, required this.startScreen});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          startScreen
      ,
      theme: AppTheme.appTheme,
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
        LogInScreen.routeName: (context) => LogInScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        VideoPlayerScreen.routeName: (context) => VideoPlayerScreen(),
        MerchantMainScreen.routeName: (context) => MerchantMainScreen(
            id: ModalRoute.of(context)!.settings.arguments as String),
        MainScreenAdmin.routeName: (context) => MainScreenAdmin()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
