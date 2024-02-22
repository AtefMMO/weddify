import 'package:flutter/material.dart';

class MerchantContainer extends StatelessWidget {
  String? content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Center(child: Text(content ?? 'Merchant Name')),
      ),
    );
  }
}
