import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weddify/models/item_model.dart';

import '../firebase_utils.dart';

part 'add_item_bloc.freezed.dart';

@freezed
class AddItemEvent with _$AddItemEvent {
  factory AddItemEvent.onSaveItem({
    required String id,
    required ItemData itemModel,
    required BuildContext context,
  }) = _onSaveItemAddItemEvent;
}

@freezed
class AddItemState with _$AddItemState {
  factory AddItemState({
    @Default(false) bool isAdding,
    String? errorMessage,
  }) = _AddItemState;
}

class AddItemBloc extends Bloc<AddItemEvent, AddItemState> {
  AddItemBloc() : super(AddItemState()) {
    on<_onSaveItemAddItemEvent>(_onSaveItem);
  }

  FutureOr<void> _onSaveItem(_onSaveItemAddItemEvent event, Emitter<AddItemState> emit) async {
    try {
      await FirebaseUtilsMerchant.addItemToFirebase(event.itemModel, event.id);

      print('Item Added Successfully');
      Navigator.pop(event.context);
      Fluttertoast.showToast(
        msg: "Item Added Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      print('Error adding Item, $e');
      // Handle error adding note to Firebase
      Fluttertoast.showToast(
        msg: "Failed to add Item Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
