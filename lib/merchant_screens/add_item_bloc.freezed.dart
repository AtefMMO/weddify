// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_item_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddItemEvent {
  String get id => throw _privateConstructorUsedError;
  ItemData get itemModel => throw _privateConstructorUsedError;
  BuildContext get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id, ItemData itemModel, BuildContext context)
        onSaveItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, ItemData itemModel, BuildContext context)?
        onSaveItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, ItemData itemModel, BuildContext context)?
        onSaveItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onSaveItemAddItemEvent value) onSaveItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onSaveItemAddItemEvent value)? onSaveItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onSaveItemAddItemEvent value)? onSaveItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddItemEventCopyWith<AddItemEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddItemEventCopyWith<$Res> {
  factory $AddItemEventCopyWith(
          AddItemEvent value, $Res Function(AddItemEvent) then) =
      _$AddItemEventCopyWithImpl<$Res, AddItemEvent>;
  @useResult
  $Res call({String id, ItemData itemModel, BuildContext context});
}

/// @nodoc
class _$AddItemEventCopyWithImpl<$Res, $Val extends AddItemEvent>
    implements $AddItemEventCopyWith<$Res> {
  _$AddItemEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemModel = null,
    Object? context = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemModel: null == itemModel
          ? _value.itemModel
          : itemModel // ignore: cast_nullable_to_non_nullable
              as ItemData,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$onSaveItemAddItemEventImplCopyWith<$Res>
    implements $AddItemEventCopyWith<$Res> {
  factory _$$onSaveItemAddItemEventImplCopyWith(
          _$onSaveItemAddItemEventImpl value,
          $Res Function(_$onSaveItemAddItemEventImpl) then) =
      __$$onSaveItemAddItemEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, ItemData itemModel, BuildContext context});
}

/// @nodoc
class __$$onSaveItemAddItemEventImplCopyWithImpl<$Res>
    extends _$AddItemEventCopyWithImpl<$Res, _$onSaveItemAddItemEventImpl>
    implements _$$onSaveItemAddItemEventImplCopyWith<$Res> {
  __$$onSaveItemAddItemEventImplCopyWithImpl(
      _$onSaveItemAddItemEventImpl _value,
      $Res Function(_$onSaveItemAddItemEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemModel = null,
    Object? context = null,
  }) {
    return _then(_$onSaveItemAddItemEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemModel: null == itemModel
          ? _value.itemModel
          : itemModel // ignore: cast_nullable_to_non_nullable
              as ItemData,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$onSaveItemAddItemEventImpl implements _onSaveItemAddItemEvent {
  _$onSaveItemAddItemEventImpl(
      {required this.id, required this.itemModel, required this.context});

  @override
  final String id;
  @override
  final ItemData itemModel;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'AddItemEvent.onSaveItem(id: $id, itemModel: $itemModel, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onSaveItemAddItemEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemModel, itemModel) ||
                other.itemModel == itemModel) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, itemModel, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onSaveItemAddItemEventImplCopyWith<_$onSaveItemAddItemEventImpl>
      get copyWith => __$$onSaveItemAddItemEventImplCopyWithImpl<
          _$onSaveItemAddItemEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id, ItemData itemModel, BuildContext context)
        onSaveItem,
  }) {
    return onSaveItem(id, itemModel, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, ItemData itemModel, BuildContext context)?
        onSaveItem,
  }) {
    return onSaveItem?.call(id, itemModel, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, ItemData itemModel, BuildContext context)?
        onSaveItem,
    required TResult orElse(),
  }) {
    if (onSaveItem != null) {
      return onSaveItem(id, itemModel, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onSaveItemAddItemEvent value) onSaveItem,
  }) {
    return onSaveItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onSaveItemAddItemEvent value)? onSaveItem,
  }) {
    return onSaveItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onSaveItemAddItemEvent value)? onSaveItem,
    required TResult orElse(),
  }) {
    if (onSaveItem != null) {
      return onSaveItem(this);
    }
    return orElse();
  }
}

abstract class _onSaveItemAddItemEvent implements AddItemEvent {
  factory _onSaveItemAddItemEvent(
      {required final String id,
      required final ItemData itemModel,
      required final BuildContext context}) = _$onSaveItemAddItemEventImpl;

  @override
  String get id;
  @override
  ItemData get itemModel;
  @override
  BuildContext get context;
  @override
  @JsonKey(ignore: true)
  _$$onSaveItemAddItemEventImplCopyWith<_$onSaveItemAddItemEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddItemState {
  bool get isAdding => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddItemStateCopyWith<AddItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddItemStateCopyWith<$Res> {
  factory $AddItemStateCopyWith(
          AddItemState value, $Res Function(AddItemState) then) =
      _$AddItemStateCopyWithImpl<$Res, AddItemState>;
  @useResult
  $Res call({bool isAdding, String? errorMessage});
}

/// @nodoc
class _$AddItemStateCopyWithImpl<$Res, $Val extends AddItemState>
    implements $AddItemStateCopyWith<$Res> {
  _$AddItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAdding = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isAdding: null == isAdding
          ? _value.isAdding
          : isAdding // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddItemStateImplCopyWith<$Res>
    implements $AddItemStateCopyWith<$Res> {
  factory _$$AddItemStateImplCopyWith(
          _$AddItemStateImpl value, $Res Function(_$AddItemStateImpl) then) =
      __$$AddItemStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAdding, String? errorMessage});
}

/// @nodoc
class __$$AddItemStateImplCopyWithImpl<$Res>
    extends _$AddItemStateCopyWithImpl<$Res, _$AddItemStateImpl>
    implements _$$AddItemStateImplCopyWith<$Res> {
  __$$AddItemStateImplCopyWithImpl(
      _$AddItemStateImpl _value, $Res Function(_$AddItemStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAdding = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$AddItemStateImpl(
      isAdding: null == isAdding
          ? _value.isAdding
          : isAdding // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddItemStateImpl implements _AddItemState {
  _$AddItemStateImpl({this.isAdding = false, this.errorMessage});

  @override
  @JsonKey()
  final bool isAdding;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AddItemState(isAdding: $isAdding, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddItemStateImpl &&
            (identical(other.isAdding, isAdding) ||
                other.isAdding == isAdding) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAdding, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddItemStateImplCopyWith<_$AddItemStateImpl> get copyWith =>
      __$$AddItemStateImplCopyWithImpl<_$AddItemStateImpl>(this, _$identity);
}

abstract class _AddItemState implements AddItemState {
  factory _AddItemState({final bool isAdding, final String? errorMessage}) =
      _$AddItemStateImpl;

  @override
  bool get isAdding;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$AddItemStateImplCopyWith<_$AddItemStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
