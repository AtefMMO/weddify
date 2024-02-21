import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  String? content;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.85,
        child: Center(child: Text(content??'Note')),
      ),
    );
  }
}
