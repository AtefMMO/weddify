import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weddify/app_theme/app_theme.dart';
import 'package:weddify/market_screen/category_screen.dart';

class MerchantContainer extends StatelessWidget {
  String? category;
  String? categoryTranslate;
  String? categoryImage;
  MerchantContainer(
      {required this.category,
      required this.categoryTranslate,
      required this.categoryImage});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CategoryScreen.routeName,
            arguments: category);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                categoryImage!,
                width: double.infinity,
                height: 160, // Set the desired height here
                fit: BoxFit.cover, // Adjust the fit to cover the entire space
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Text(
                      categoryTranslate ?? 'Category Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'RTL-MochaYemen-Sugar',
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 4
                          ..color = Colors.black,
                      ),
                    ),
                    Text(
                      categoryTranslate ?? 'Category Name',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'RTL-MochaYemen-Sugar',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
               Stack(
                  children: [
                    Text(
                      category ?? 'Category Name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'RTL-MochaYemen-Sugar',
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 4
                          ..color = Colors.black,),
                    ),Text(
                      category ?? 'Category Name',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'RTL-MochaYemen-Sugar',
                       ),
                    )
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
