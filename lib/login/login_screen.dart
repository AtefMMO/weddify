import 'package:flutter/material.dart';
import 'package:weddify/custom_widgets/custom_text_form_field.dart';
import 'package:weddify/login/signup_screen.dart';

import 'login_bloc.dart';

class LogInScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  var formKey = GlobalKey<FormState>();

  bool hide = false;

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.6,
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
                      child: CustomTextFormField(
                        controller: _emailController,
                        hintText: 'Email Address',
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'please enter Email';
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return 'invalid email';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: CustomTextFormField(
                        icon: InkWell(
                            onTap: () {
                              if (hide) {
                                hide = false;
                              } else {
                                hide = true;
                              }
                              setState(() {});
                            },
                            child: hide
                                ? Icon(Icons.remove_red_eye_outlined)
                                : Icon(Icons.remove_red_eye)),
                        controller: _passwordController,
                        obsecureText: hide ? true : false,
                        hintText: 'Password',
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'please enter Password';
                          }
                          if (value.length < 6 || value.length > 30) {
                            return 'password should be larger than 6 and less than 30';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              _loginBloc.add(
                                LoginEvent.onTappedLogIn(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    context: context),
                              );
                            }
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
                            const Text('Don\'t have an account click'),
                            InkWell(
                              child: const Text(
                                ' here',
                                style: TextStyle(color: Colors.purpleAccent),
                              ),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, SignUpScreen.routeName);
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
