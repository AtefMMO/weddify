import 'package:flutter/material.dart';
import 'package:weddify/login/signup_bloc.dart';

import '../custom_widgets/custom_text_form_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hide = true;
  String? passString;
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _fullnameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

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
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.07),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.45),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomTextFormField(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'please enter your name';
                              }
                            },
                            hintText: 'Full Name',
                            controller: _fullnameController),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomTextFormField(
                          hintText: 'Email Address',
                          controller: _emailController,
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
                            hintText: 'Password',
                            controller: _passwordController,
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
                            obsecureText: hide ? true : false,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'please enter Password';
                              }
                              if (value.length < 6 || value.length > 30) {
                                return 'password should be larger than 6 and less than 30';
                              }
                              passString = value;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomTextFormField(
                            hintText: 'Confirm Password',
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
                            obsecureText: hide ? true : false,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'please confirm password';
                              }

                              if (passString != value) {
                                return 'password mismatch';
                              }
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: InkWell(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                SignupBloc().add(SignupEvent.onTappedSignup(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    fullName: _fullnameController.text,
                                    context: context,
                                    isAdmin: false));
                              }
                            },
                            child:
                                Image.asset('assets/images/createAccount.png')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account click'),
                              InkWell(
                                child: const Text(
                                  ' here',
                                  style: TextStyle(color: Colors.purpleAccent),
                                ),
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, LogInScreen.routeName);
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
