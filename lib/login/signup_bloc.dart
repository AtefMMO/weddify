import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weddify/firebase_utils.dart';
import 'package:weddify/init_route.dart';

import '../custom_widgets/dialog_utils.dart';
import 'user_data.dart';

part 'signup_bloc.freezed.dart';

@freezed
class SignupEvent with _$SignupEvent {
  factory SignupEvent.onTappedSignup(
      {required String email,
      required String password,
      required String fullName,
      required bool isAdmin,
      required BuildContext context}) = _onTappedSignupEvent;
}

@freezed
class SignupState with _$SignupState {
  factory SignupState({
    @Default(false) bool isAuthenticating,
    String? errorMessage,
  }) = _SignupState;
}

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState()) {
    on<_onTappedSignupEvent>(_onTappedSignup);
  }
  FutureOr<void> _onTappedSignup(_onTappedSignupEvent event, Emitter<SignupState> emit) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      DialogUtils.showLoading(event.context, 'Loading...');

      await UserFirebaseUtils.addUserToDb(
          UserData(email: event.email, name: event.fullName, id: credential.user!.uid, isAdmin: false, isMerchant: false));

      UserData? user = await UserFirebaseUtils.readUserFromDb(credential.user!.uid);

      Fluttertoast.showToast(
          msg: "Account Created Succesfuly Welcome ${event.fullName}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pushAndRemoveUntil(
        event.context,
        MaterialPageRoute(builder: (BuildContext context) {
          return MainScreen(username: user?.name ?? '');
        }),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DialogUtils.showMessage(event.context, 'Weak Password', barrierDismissible: true, title: 'Error');
      } else if (e.code == 'email-already-in-use') {
        DialogUtils.showMessage(event.context, 'Email Already in use', barrierDismissible: true, title: 'Error');
      }
    } catch (e) {
      DialogUtils.showMessage(event.context, '$e', barrierDismissible: true, title: 'Error');
      print(e);
    }
  }
}
