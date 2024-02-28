import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
      print(credential.user!.uid); //user id

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
          return MainScreen();
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

class UserFirebaseUtils {
  static CollectionReference<UserData> getUserCollection() {
    return FirebaseFirestore.instance.collection(UserData.collectionName).withConverter(
        fromFirestore: (snapshot, options) => UserData.fromJson(snapshot.data()!), toFirestore: (user, options) => user.toFireStore());
  }

  static Future<void> addUserToDb(UserData user) {
    return getUserCollection().doc(user.id).set(user);
  }

  static Future<UserData?> readUserFromDb(String id) async {
    var doc = await getUserCollection().doc(id).get();
    return doc.data();
  }

  static Future<void> deleteUserFromDb(UserData user) {
    getUserCollection().doc(user.id).collection(UserData.collectionName).doc().delete();
    return getUserCollection().doc(user.id).delete();
  }
}
