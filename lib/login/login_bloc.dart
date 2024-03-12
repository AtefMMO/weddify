import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weddify/admin_screens/admin_main_screen.dart';
import 'package:weddify/custom_widgets/dialog_utils.dart';
import 'package:weddify/init_route.dart';
import 'package:weddify/login/user_data.dart';
import 'package:weddify/merchant_screens/merchant_main_screen.dart';

import '../firebase_utils.dart';

part 'login_bloc.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  factory LoginEvent.onTappedLogIn(
      {required String email,
      required String password,
      required BuildContext context}) = _onTappedSaveLoginEvent;
  factory LoginEvent.onTappedEyeIcon() = _onTappedEyeIconLoginEvent;
}

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool isAuthenticating,
    String? errorMessage,
   @Default('')String id,
    @Default(true) bool hide,
  }) = _LoginState;
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<_onTappedSaveLoginEvent>(_onTapLogIn);
    on<_onTappedEyeIconLoginEvent>(_onTapEyeIcon);
  }
  FutureOr<void> _onTapLogIn(
      _onTappedSaveLoginEvent event, Emitter<LoginState> emit) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      DialogUtils.showLoading(event.context, 'Loading...');

      UserData? user = await UserFirebaseUtils.readUserFromDb(credential.user!.uid); // this is the user data mazen from firestore db
print(credential.user!.uid);
      emit(state.copyWith(id: credential.user!.uid));
print(state.id);
      Fluttertoast.showToast(
          msg: "Sign in Succesful Welcome ${user!.name}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      if (user.isMerchant ?? false) {
        Navigator.pushAndRemoveUntil(
          event.context,
          MaterialPageRoute(builder: (BuildContext context) {
            return MerchantMainScreen();
          }),
          (route) => false,
        );
      } else if (user.isAdmin ?? false) {
        Navigator.pushAndRemoveUntil(
          event.context,
          MaterialPageRoute(builder: (BuildContext context) {
            return MainScreenAdmin();
          }),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          event.context,
          MaterialPageRoute(builder: (BuildContext context) {
            return MainScreen();
          }),
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
      DialogUtils.showMessage(event.context, 'Wrong Email or Password',
          barrierDismissible: true, title: 'Error');
    }
  }

  FutureOr<void> _onTapEyeIcon(
      _onTappedEyeIconLoginEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(hide: !state.hide));
  }
}
