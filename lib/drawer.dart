import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  Function onDrawerItemClick;
  HomeDrawer({required this.onDrawerItemClick});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.225,
              width: double.infinity,
              color: Colors.pink,
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Text(
                  'UserName',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.black,
                size: 35,
              ),
              Text(
                '  My Profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors.black,
                size: 35,
              ),
              Text(
                '  Settings',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.list,
                color: Colors.black,
                size: 35,
              ),
              Text(
                '  Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.black,
                size: 35,
              ),
              Text(
                '  info',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
        ),

        Padding(
            padding:EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('\t \tlog out\t \t',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
            )),
      ],
    );
  }
}
