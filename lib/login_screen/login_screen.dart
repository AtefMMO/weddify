import 'package:flutter/material.dart';
import 'package:weddify/custom_widgets/custom_text_form_field.dart';
import 'package:weddify/login_screen/signup_screen.dart';

import '../init_route.dart';

class LogInScreen extends StatelessWidget {
  static const String routeName = 'LoginScreen';
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Sign_in.png',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.4,
                        bottom: MediaQuery.of(context).size.width * 0.08),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: CustomTextFormField(hintText: 'Email Address'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: CustomTextFormField(hintText: 'Password'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                        onTap: () {
                          // mezo validation here
                          Navigator.pushReplacementNamed(
                              context, MainScreen.routeName);
                        },
                        child: Image.asset('assets/images/signIn.png')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account click'),
                          InkWell(
                            child: Text(
                              ' here',
                              style: TextStyle(color: Colors.purpleAccent),
                            ),
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, SignUpScreen.routeName);
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
