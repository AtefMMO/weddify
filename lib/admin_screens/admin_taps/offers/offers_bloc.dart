import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'offers_bloc.freezed.dart';

@freezed
class OffersEvent with _$OffersEvent {
  factory OffersEvent.onAddOffer() = _onAddOfferOffersEvent;
}

@freezed
class OffersState with _$OffersState {
  factory OffersState({
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _OffersState;
}

class OffersBloc extends Bloc<OffersEvent, OffersState> {
  OffersBloc() : super(OffersState()) {

  }
}
