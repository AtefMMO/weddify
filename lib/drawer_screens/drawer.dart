import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weddify/app_theme/app_theme.dart';

import 'package:weddify/drawer_screens/my_profile_screen.dart';
import 'package:weddify/login/user_data.dart';

class HomeDrawer extends StatelessWidget {
  final Function onDrawerItemClick;
  final UserData user;
final  String facebookUrl='https://www.facebook.com/people/Weddify/61556994101470/?mibextid=ZbWKwL';
  final  String instagramUrl='https://www.instagram.com/weddi_fy?igsh=MWc2czZ1b2xpbzUxdQ==';
  const HomeDrawer(
      {super.key, required this.onDrawerItemClick, required this.user});

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
              color: AppTheme.mainColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Text(
                  'Hello ${user.name}',
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyProfileScreen(
                      user: user,
                    )));
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
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
        ),
         Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.facebook,
                color: Colors.black,
                size: 35,
              ),
              InkWell(onTap:()async{
                if(await canLaunchUrl(Uri.parse(facebookUrl))){
                  await launchUrl(Uri.parse(facebookUrl));
                }else{
                  print('failed to launch');
                }
              } ,
                child: Text(
                  '  Facebook',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )
            ],
          ),
        ),
     Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                FontAwesomeIcons.instagram,
                color: Colors.black,
                size: 35,
              ),
              InkWell(onTap: ()async{
                if(await canLaunchUrl(Uri.parse(instagramUrl))){
                  await launchUrl(Uri.parse(instagramUrl));
                }else{
                  print('failed to launch');
                }
              },
                child: Text(
                  '  Instagram',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
