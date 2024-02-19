// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignupEvent {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;
  BuildContext get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, String fullName,
            bool isAdmin, BuildContext context)
        onTappedSignup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String fullName,
            bool isAdmin, BuildContext context)?
        onTappedSignup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String fullName,
            bool isAdmin, BuildContext context)?
        onTappedSignup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onTappedSignupEvent value) onTappedSignup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onTappedSignupEvent value)? onTappedSignup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onTappedSignupEvent value)? onTappedSignup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupEventCopyWith<SignupEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupEventCopyWith<$Res> {
  factory $SignupEventCopyWith(
          SignupEvent value, $Res Function(SignupEvent) then) =
      _$SignupEventCopyWithImpl<$Res, SignupEvent>;
  @useResult
  $Res call(
      {String email,
      String password,
      String fullName,
      bool isAdmin,
      BuildContext context});
}

/// @nodoc
class _$SignupEventCopyWithImpl<$Res, $Val extends SignupEvent>
    implements $SignupEventCopyWith<$Res> {
  _$SignupEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fullName = null,
    Object? isAdmin = null,
    Object? context = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$onTappedSignupEventImplCopyWith<$Res>
    implements $SignupEventCopyWith<$Res> {
  factory _$$onTappedSignupEventImplCopyWith(_$onTappedSignupEventImpl value,
          $Res Function(_$onTappedSignupEventImpl) then) =
      __$$onTappedSignupEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String fullName,
      bool isAdmin,
      BuildContext context});
}

/// @nodoc
class __$$onTappedSignupEventImplCopyWithImpl<$Res>
    extends _$SignupEventCopyWithImpl<$Res, _$onTappedSignupEventImpl>
    implements _$$onTappedSignupEventImplCopyWith<$Res> {
  __$$onTappedSignupEventImplCopyWithImpl(_$onTappedSignupEventImpl _value,
      $Res Function(_$onTappedSignupEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fullName = null,
    Object? isAdmin = null,
    Object? context = null,
  }) {
    return _then(_$onTappedSignupEventImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$onTappedSignupEventImpl implements _onTappedSignupEvent {
  _$onTappedSignupEventImpl(
      {required this.email,
      required this.password,
      required this.fullName,
      required this.isAdmin,
      required this.context});

  @override
  final String email;
  @override
  final String password;
  @override
  final String fullName;
  @override
  final bool isAdmin;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'SignupEvent.onTappedSignup(email: $email, password: $password, fullName: $fullName, isAdmin: $isAdmin, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onTappedSignupEventImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, fullName, isAdmin, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onTappedSignupEventImplCopyWith<_$onTappedSignupEventImpl> get copyWith =>
      __$$onTappedSignupEventImplCopyWithImpl<_$onTappedSignupEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, String fullName,
            bool isAdmin, BuildContext context)
        onTappedSignup,
  }) {
    return onTappedSignup(email, password, fullName, isAdmin, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String fullName,
            bool isAdmin, BuildContext context)?
        onTappedSignup,
  }) {
    return onTappedSignup?.call(email, password, fullName, isAdmin, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String fullName,
            bool isAdmin, BuildContext context)?
        onTappedSignup,
    required TResult orElse(),
  }) {
    if (onTappedSignup != null) {
      return onTappedSignup(email, password, fullName, isAdmin, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onTappedSignupEvent value) onTappedSignup,
  }) {
    return onTappedSignup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onTappedSignupEvent value)? onTappedSignup,
  }) {
    return onTappedSignup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onTappedSignupEvent value)? onTappedSignup,
    required TResult orElse(),
  }) {
    if (onTappedSignup != null) {
      return onTappedSignup(this);
    }
    return orElse();
  }
}

abstract class _onTappedSignupEvent implements SignupEvent {
  factory _onTappedSignupEvent(
      {required final String email,
      required final String password,
      required final String fullName,
      required final bool isAdmin,
      required final BuildContext context}) = _$onTappedSignupEventImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  String get fullName;
  @override
  bool get isAdmin;
  @override
  BuildContext get context;
  @override
  @JsonKey(ignore: true)
  _$$onTappedSignupEventImplCopyWith<_$onTappedSignupEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignupState {
  bool get isAuthenticating => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupStateCopyWith<SignupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupStateCopyWith<$Res> {
  factory $SignupStateCopyWith(
          SignupState value, $Res Function(SignupState) then) =
      _$SignupStateCopyWithImpl<$Res, SignupState>;
  @useResult
  $Res call({bool isAuthenticating, String? errorMessage});
}

/// @nodoc
class _$SignupStateCopyWithImpl<$Res, $Val extends SignupState>
    implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthenticating = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isAuthenticating: null == isAuthenticating
          ? _value.isAuthenticating
          : isAuthenticating // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupStateImplCopyWith<$Res>
    implements $SignupStateCopyWith<$Res> {
  factory _$$SignupStateImplCopyWith(
          _$SignupStateImpl value, $Res Function(_$SignupStateImpl) then) =
      __$$SignupStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAuthenticating, String? errorMessage});
}

/// @nodoc
class __$$SignupStateImplCopyWithImpl<$Res>
    extends _$SignupStateCopyWithImpl<$Res, _$SignupStateImpl>
    implements _$$SignupStateImplCopyWith<$Res> {
  __$$SignupStateImplCopyWithImpl(
      _$SignupStateImpl _value, $Res Function(_$SignupStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthenticating = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$SignupStateImpl(
      isAuthenticating: null == isAuthenticating
          ? _value.isAuthenticating
          : isAuthenticating // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SignupStateImpl implements _SignupState {
  _$SignupStateImpl({this.isAuthenticating = false, this.errorMessage});

  @override
  @JsonKey()
  final bool isAuthenticating;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SignupState(isAuthenticating: $isAuthenticating, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupStateImpl &&
            (identical(other.isAuthenticating, isAuthenticating) ||
                other.isAuthenticating == isAuthenticating) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAuthenticating, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupStateImplCopyWith<_$SignupStateImpl> get copyWith =>
      __$$SignupStateImplCopyWithImpl<_$SignupStateImpl>(this, _$identity);
}

abstract class _SignupState implements SignupState {
  factory _SignupState(
      {final bool isAuthenticating,
      final String? errorMessage}) = _$SignupStateImpl;

  @override
  bool get isAuthenticating;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$SignupStateImplCopyWith<_$SignupStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
