import 'package:flutter/material.dart';
import 'package:weddify/login_screen/signup_bloc.dart';

import '../custom_widgets/custom_text_form_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = 'SignUpScreen';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullnameController = TextEditingController();

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
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.45),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomTextFormField(hintText: 'Full Name', controller: _fullnameController),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomTextFormField(hintText: 'Email Address', controller: _emailController),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomTextFormField(hintText: 'Password', controller: _passwordController),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomTextFormField(hintText: 'Confirm Password'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: InkWell(
                            onTap: () {
                              SignupBloc().add(SignupEvent.onTappedSignup(
                                email: _emailController.text,
                                password: _passwordController.text,
                                fullName: _fullnameController.text,
                              ));
                            },
                            child: Image.asset('assets/images/createAccount.png')),
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
                                  Navigator.pushReplacementNamed(context, LogInScreen.routeName);
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
