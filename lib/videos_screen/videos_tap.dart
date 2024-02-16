import 'package:flutter/material.dart';

class Videos extends StatelessWidget {


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
      ],
    );
  }
}