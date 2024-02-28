// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MerchantEvent {
  ItemModel get itemModel => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ItemModel itemModel, String userId) onAddItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ItemModel itemModel, String userId)? onAddItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ItemModel itemModel, String userId)? onAddItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onAddItemMerchantEvent value) onAddItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onAddItemMerchantEvent value)? onAddItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onAddItemMerchantEvent value)? onAddItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MerchantEventCopyWith<MerchantEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchantEventCopyWith<$Res> {
  factory $MerchantEventCopyWith(
          MerchantEvent value, $Res Function(MerchantEvent) then) =
      _$MerchantEventCopyWithImpl<$Res, MerchantEvent>;
  @useResult
  $Res call({ItemModel itemModel, String userId});
}

/// @nodoc
class _$MerchantEventCopyWithImpl<$Res, $Val extends MerchantEvent>
    implements $MerchantEventCopyWith<$Res> {
  _$MerchantEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemModel = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      itemModel: null == itemModel
          ? _value.itemModel
          : itemModel // ignore: cast_nullable_to_non_nullable
              as ItemModel,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$onAddItemMerchantEventImplCopyWith<$Res>
    implements $MerchantEventCopyWith<$Res> {
  factory _$$onAddItemMerchantEventImplCopyWith(
          _$onAddItemMerchantEventImpl value,
          $Res Function(_$onAddItemMerchantEventImpl) then) =
      __$$onAddItemMerchantEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ItemModel itemModel, String userId});
}

/// @nodoc
class __$$onAddItemMerchantEventImplCopyWithImpl<$Res>
    extends _$MerchantEventCopyWithImpl<$Res, _$onAddItemMerchantEventImpl>
    implements _$$onAddItemMerchantEventImplCopyWith<$Res> {
  __$$onAddItemMerchantEventImplCopyWithImpl(
      _$onAddItemMerchantEventImpl _value,
      $Res Function(_$onAddItemMerchantEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemModel = null,
    Object? userId = null,
  }) {
    return _then(_$onAddItemMerchantEventImpl(
      itemModel: null == itemModel
          ? _value.itemModel
          : itemModel // ignore: cast_nullable_to_non_nullable
              as ItemModel,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$onAddItemMerchantEventImpl implements _onAddItemMerchantEvent {
  _$onAddItemMerchantEventImpl({required this.itemModel, required this.userId});

  @override
  final ItemModel itemModel;
  @override
  final String userId;

  @override
  String toString() {
    return 'MerchantEvent.onAddItem(itemModel: $itemModel, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onAddItemMerchantEventImpl &&
            (identical(other.itemModel, itemModel) ||
                other.itemModel == itemModel) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemModel, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onAddItemMerchantEventImplCopyWith<_$onAddItemMerchantEventImpl>
      get copyWith => __$$onAddItemMerchantEventImplCopyWithImpl<
          _$onAddItemMerchantEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ItemModel itemModel, String userId) onAddItem,
  }) {
    return onAddItem(itemModel, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ItemModel itemModel, String userId)? onAddItem,
  }) {
    return onAddItem?.call(itemModel, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ItemModel itemModel, String userId)? onAddItem,
    required TResult orElse(),
  }) {
    if (onAddItem != null) {
      return onAddItem(itemModel, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onAddItemMerchantEvent value) onAddItem,
  }) {
    return onAddItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onAddItemMerchantEvent value)? onAddItem,
  }) {
    return onAddItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onAddItemMerchantEvent value)? onAddItem,
    required TResult orElse(),
  }) {
    if (onAddItem != null) {
      return onAddItem(this);
    }
    return orElse();
  }
}

abstract class _onAddItemMerchantEvent implements MerchantEvent {
  factory _onAddItemMerchantEvent(
      {required final ItemModel itemModel,
      required final String userId}) = _$onAddItemMerchantEventImpl;

  @override
  ItemModel get itemModel;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$onAddItemMerchantEventImplCopyWith<_$onAddItemMerchantEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MerchantState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MerchantStateCopyWith<MerchantState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchantStateCopyWith<$Res> {
  factory $MerchantStateCopyWith(
          MerchantState value, $Res Function(MerchantState) then) =
      _$MerchantStateCopyWithImpl<$Res, MerchantState>;
  @useResult
  $Res call({bool isLoading, String? errorMessage});
}

/// @nodoc
class _$MerchantStateCopyWithImpl<$Res, $Val extends MerchantState>
    implements $MerchantStateCopyWith<$Res> {
  _$MerchantStateCopyWithImpl(this._value, this._then);

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
abstract class _$$MerchantStateImplCopyWith<$Res>
    implements $MerchantStateCopyWith<$Res> {
  factory _$$MerchantStateImplCopyWith(
          _$MerchantStateImpl value, $Res Function(_$MerchantStateImpl) then) =
      __$$MerchantStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$MerchantStateImplCopyWithImpl<$Res>
    extends _$MerchantStateCopyWithImpl<$Res, _$MerchantStateImpl>
    implements _$$MerchantStateImplCopyWith<$Res> {
  __$$MerchantStateImplCopyWithImpl(
      _$MerchantStateImpl _value, $Res Function(_$MerchantStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$MerchantStateImpl(
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

class _$MerchantStateImpl implements _MerchantState {
  _$MerchantStateImpl({this.isLoading = false, this.errorMessage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'MerchantState(isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MerchantStateImpl &&
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
  _$$MerchantStateImplCopyWith<_$MerchantStateImpl> get copyWith =>
      __$$MerchantStateImplCopyWithImpl<_$MerchantStateImpl>(this, _$identity);
}

abstract class _MerchantState implements MerchantState {
  factory _MerchantState({final bool isLoading, final String? errorMessage}) =
      _$MerchantStateImpl;

  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$MerchantStateImplCopyWith<_$MerchantStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
