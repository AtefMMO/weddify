import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weddify/init_route.dart';
import 'package:weddify/login/user_data.dart';
import 'package:weddify/offers_screen/offers_tap.dart';

part 'signup_bloc.freezed.dart';

@freezed
class SignupEvent with _$SignupEvent {
  factory SignupEvent.onTappedSignup({
    required String email,
    required String password,
    required String fullName,
    required bool isAdmin,
    required BuildContext context
  }) = _onTappedSignupEvent;
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
    final firebase = FirebaseAuth.instance;

    emit(state.copyWith(isAuthenticating: true));

    final userData = await firebase.createUserWithEmailAndPassword(email: event.email, password: event.password);

    //final storageRef = FirebaseStorage.instance.ref().child('users_images').child('${userData.user!.uid}.jpg'); // create path in firebase

    //await storageRef.putFile(selectedImage!); // send the selected image url to firebase

  //  final imageUrl = await storageRef.getDownloadURL(); // get the image url

    // await FirebaseFirestore.instance.collection('users').doc(userData.user!.uid).set(
    //   {
    //     'username': event.fullName,
    //     'email': event.email,
    //   },
    // );
    // put navigation here mr atef
Navigator.pushReplacementNamed(event.context, MainScreen.routeName);

  }
}
