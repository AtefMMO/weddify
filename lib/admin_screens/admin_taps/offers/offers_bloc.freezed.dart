// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offers_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OffersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onAddOffer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onAddOffer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onAddOffer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onAddOfferOffersEvent value) onAddOffer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onAddOfferOffersEvent value)? onAddOffer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onAddOfferOffersEvent value)? onAddOffer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OffersEventCopyWith<$Res> {
  factory $OffersEventCopyWith(
          OffersEvent value, $Res Function(OffersEvent) then) =
      _$OffersEventCopyWithImpl<$Res, OffersEvent>;
}

/// @nodoc
class _$OffersEventCopyWithImpl<$Res, $Val extends OffersEvent>
    implements $OffersEventCopyWith<$Res> {
  _$OffersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$onAddOfferOffersEventImplCopyWith<$Res> {
  factory _$$onAddOfferOffersEventImplCopyWith(
          _$onAddOfferOffersEventImpl value,
          $Res Function(_$onAddOfferOffersEventImpl) then) =
      __$$onAddOfferOffersEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$onAddOfferOffersEventImplCopyWithImpl<$Res>
    extends _$OffersEventCopyWithImpl<$Res, _$onAddOfferOffersEventImpl>
    implements _$$onAddOfferOffersEventImplCopyWith<$Res> {
  __$$onAddOfferOffersEventImplCopyWithImpl(_$onAddOfferOffersEventImpl _value,
      $Res Function(_$onAddOfferOffersEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$onAddOfferOffersEventImpl implements _onAddOfferOffersEvent {
  _$onAddOfferOffersEventImpl();

  @override
  String toString() {
    return 'OffersEvent.onAddOffer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onAddOfferOffersEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onAddOffer,
  }) {
    return onAddOffer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onAddOffer,
  }) {
    return onAddOffer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onAddOffer,
    required TResult orElse(),
  }) {
    if (onAddOffer != null) {
      return onAddOffer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onAddOfferOffersEvent value) onAddOffer,
  }) {
    return onAddOffer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onAddOfferOffersEvent value)? onAddOffer,
  }) {
    return onAddOffer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onAddOfferOffersEvent value)? onAddOffer,
    required TResult orElse(),
  }) {
    if (onAddOffer != null) {
      return onAddOffer(this);
    }
    return orElse();
  }
}

abstract class _onAddOfferOffersEvent implements OffersEvent {
  factory _onAddOfferOffersEvent() = _$onAddOfferOffersEventImpl;
}

/// @nodoc
mixin _$OffersState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OffersStateCopyWith<OffersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OffersStateCopyWith<$Res> {
  factory $OffersStateCopyWith(
          OffersState value, $Res Function(OffersState) then) =
      _$OffersStateCopyWithImpl<$Res, OffersState>;
  @useResult
  $Res call({bool isLoading, String? errorMessage});
}

/// @nodoc
class _$OffersStateCopyWithImpl<$Res, $Val extends OffersState>
    implements $OffersStateCopyWith<$Res> {
  _$OffersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OffersStateImplCopyWith<$Res>
    implements $OffersStateCopyWith<$Res> {
  factory _$$OffersStateImplCopyWith(
          _$OffersStateImpl value, $Res Function(_$OffersStateImpl) then) =
      __$$OffersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$OffersStateImplCopyWithImpl<$Res>
    extends _$OffersStateCopyWithImpl<$Res, _$OffersStateImpl>
    implements _$$OffersStateImplCopyWith<$Res> {
  __$$OffersStateImplCopyWithImpl(
      _$OffersStateImpl _value, $Res Function(_$OffersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$OffersStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OffersStateImpl implements _OffersState {
  _$OffersStateImpl({this.isLoading = false, this.errorMessage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'OffersState(isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OffersStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OffersStateImplCopyWith<_$OffersStateImpl> get copyWith =>
      __$$OffersStateImplCopyWithImpl<_$OffersStateImpl>(this, _$identity);
}

abstract class _OffersState implements OffersState {
  factory _OffersState({final bool isLoading, final String? errorMessage}) =
      _$OffersStateImpl;

  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$OffersStateImplCopyWith<_$OffersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
