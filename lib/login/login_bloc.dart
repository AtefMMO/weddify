import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weddify/init_route.dart';
part 'login_bloc.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  factory LoginEvent.onTappedLogIn({
    required String email,
    required String password,
    required BuildContext context
  }) = _onTappedSaveLoginEvent;
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
    on<_onTappedSaveLoginEvent>(_onTappedLogIn);
  }
  FutureOr<void> _onTappedLogIn(
      _onTappedSaveLoginEvent event, Emitter<LoginState> emit) async {
    final firebase = FirebaseAuth.instance;

    emit(state.copyWith(isAuthenticating: true));

    final userCreditials = await firebase.signInWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );
    Navigator.pushReplacementNamed(event.context, MainScreen.routeName);
  }
}
