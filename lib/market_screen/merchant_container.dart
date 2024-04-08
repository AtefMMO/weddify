import 'package:flutter/material.dart';
import 'package:weddify/market_screen/category_screen.dart';

class MerchantContainer extends StatelessWidget {
  String? category;
MerchantContainer({required this.category});
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      Navigator.pushNamed(context, CategoryScreen.routeName,arguments: category);
    },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Center(child: Text(category ?? 'Category Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
        ),
      ),
    );
  }
}
