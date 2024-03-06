import 'package:flutter/material.dart';
import 'package:weddify/notes_screen/note._container.dart';

class NotesAdmin extends StatelessWidget {


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
        Padding(
          padding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Center(
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(' Find the Best',style: TextStyle(color:
                  Colors.white,fontSize: 24)),
                  Text(' Deals, Anytime,\n Anywhere!',style: TextStyle(color:
                  Colors.white,fontSize: 26,fontWeight: FontWeight.bold),),
                  Note(),
                  Note(),
                  Note(),
                  Note(),
                  Note(),
                  Note(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}