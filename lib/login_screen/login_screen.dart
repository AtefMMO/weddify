import 'package:flutter/material.dart';
import 'package:weddify/custom_widgets/custom_text_form_field.dart';
import 'package:weddify/login_screen/login_bloc.dart';
import 'package:weddify/login_screen/signup_screen.dart';

class LogInScreen extends StatelessWidget {
  static const String routeName = 'LoginScreen';
  var formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final LoginBloc _loginBloc = LoginBloc();

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
                    padding:
                        EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.4, bottom: MediaQuery.of(context).size.width * 0.08),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: CustomTextFormField(
                      controller: _emailController,
                      hintText: 'Email Address',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: CustomTextFormField(
                      controller: _passwordController,
                      hintText: 'Password',
                      validator: (value) {
                        if (value == null || value.trim().length < 5) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                        onTap: () {
                          _loginBloc.add(
                            LoginEvent.onTappedLogIn(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                          // Navigator.pushReplacementNamed(context, MainScreen.routeName);
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
                              Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
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
