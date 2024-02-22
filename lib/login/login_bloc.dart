import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weddify/custom_widgets/dialog_utils.dart';
import 'package:weddify/init_route.dart';
import 'package:weddify/login/signup_bloc.dart';
import 'package:weddify/login/user_data.dart';
part 'login_bloc.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  factory LoginEvent.onTappedLogIn(
      {required String email,
      required String password,
      required BuildContext context}) = _onTappedSaveLoginEvent;
}

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool isAuthenticating,
    String? errorMessage,
  }) = _LoginState;
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<_onTappedSaveLoginEvent>(_onTapLogIn);
  }
  FutureOr<void> _onTapLogIn(
      _onTappedSaveLoginEvent event, Emitter<LoginState> emit) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      UserData? user = await UserFirebaseUtils.readUserFromDb(credential
          .user!.uid); // this is the user data mazen from firestore db
      print('${user!.email}'); //all working perfectly firebase is done
      print('${user!.name}');
      print('${user!.id}');
      Navigator.pushReplacementNamed(event.context, MainScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
      DialogUtils.showMessage(event.context, 'Wrong Email or Password',
          barrierDismissible: true, title: 'Error');
    }
  }
}
