import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weddify/login/user_data.dart';

import '../firebase_utils.dart';
import '../models/item_model.dart';

part 'merchant_bloc.freezed.dart';

@freezed
class MerchantEvent with _$MerchantEvent {
  factory MerchantEvent.onAddItem({
    required ItemModel itemModel,
    required String id,
  }) = _onAddItemMerchantEvent;
}

@freezed
class MerchantState with _$MerchantState {
  factory MerchantState({
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _MerchantState;
}

class MerchantBloc extends Bloc<MerchantEvent, MerchantState> {
  MerchantBloc() : super(MerchantState()) {
    on<_onAddItemMerchantEvent>(_onAddItem);
  }

  FutureOr<void> _onAddItem(_onAddItemMerchantEvent event, Emitter<MerchantState> emit) async {
    emit(state.copyWith(isLoading: true));
    await UserFirebaseUtils.addItemToDb(event.itemModel, event.id);
    emit(state.copyWith(isLoading: false));
  }
}
