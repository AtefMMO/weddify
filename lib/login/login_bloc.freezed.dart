// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String email, String password, BuildContext context)
        onTappedLogIn,
    required TResult Function() onTappedEyeIcon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, BuildContext context)?
        onTappedLogIn,
    TResult? Function()? onTappedEyeIcon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, BuildContext context)?
        onTappedLogIn,
    TResult Function()? onTappedEyeIcon,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onTappedSaveLoginEvent value) onTappedLogIn,
    required TResult Function(_onTappedEyeIconLoginEvent value) onTappedEyeIcon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onTappedSaveLoginEvent value)? onTappedLogIn,
    TResult? Function(_onTappedEyeIconLoginEvent value)? onTappedEyeIcon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onTappedSaveLoginEvent value)? onTappedLogIn,
    TResult Function(_onTappedEyeIconLoginEvent value)? onTappedEyeIcon,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$onTappedSaveLoginEventImplCopyWith<$Res> {
  factory _$$onTappedSaveLoginEventImplCopyWith(
          _$onTappedSaveLoginEventImpl value,
          $Res Function(_$onTappedSaveLoginEventImpl) then) =
      __$$onTappedSaveLoginEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password, BuildContext context});
}

/// @nodoc
class __$$onTappedSaveLoginEventImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$onTappedSaveLoginEventImpl>
    implements _$$onTappedSaveLoginEventImplCopyWith<$Res> {
  __$$onTappedSaveLoginEventImplCopyWithImpl(
      _$onTappedSaveLoginEventImpl _value,
      $Res Function(_$onTappedSaveLoginEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? context = null,
  }) {
    return _then(_$onTappedSaveLoginEventImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$onTappedSaveLoginEventImpl implements _onTappedSaveLoginEvent {
  _$onTappedSaveLoginEventImpl(
      {required this.email, required this.password, required this.context});

  @override
  final String email;
  @override
  final String password;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'LoginEvent.onTappedLogIn(email: $email, password: $password, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onTappedSaveLoginEventImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onTappedSaveLoginEventImplCopyWith<_$onTappedSaveLoginEventImpl>
      get copyWith => __$$onTappedSaveLoginEventImplCopyWithImpl<
          _$onTappedSaveLoginEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String email, String password, BuildContext context)
        onTappedLogIn,
    required TResult Function() onTappedEyeIcon,
  }) {
    return onTappedLogIn(email, password, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, BuildContext context)?
        onTappedLogIn,
    TResult? Function()? onTappedEyeIcon,
  }) {
    return onTappedLogIn?.call(email, password, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, BuildContext context)?
        onTappedLogIn,
    TResult Function()? onTappedEyeIcon,
    required TResult orElse(),
  }) {
    if (onTappedLogIn != null) {
      return onTappedLogIn(email, password, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onTappedSaveLoginEvent value) onTappedLogIn,
    required TResult Function(_onTappedEyeIconLoginEvent value) onTappedEyeIcon,
  }) {
    return onTappedLogIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onTappedSaveLoginEvent value)? onTappedLogIn,
    TResult? Function(_onTappedEyeIconLoginEvent value)? onTappedEyeIcon,
  }) {
    return onTappedLogIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onTappedSaveLoginEvent value)? onTappedLogIn,
    TResult Function(_onTappedEyeIconLoginEvent value)? onTappedEyeIcon,
    required TResult orElse(),
  }) {
    if (onTappedLogIn != null) {
      return onTappedLogIn(this);
    }
    return orElse();
  }
}

abstract class _onTappedSaveLoginEvent implements LoginEvent {
  factory _onTappedSaveLoginEvent(
      {required final String email,
      required final String password,
      required final BuildContext context}) = _$onTappedSaveLoginEventImpl;

  String get email;
  String get password;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$$onTappedSaveLoginEventImplCopyWith<_$onTappedSaveLoginEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onTappedEyeIconLoginEventImplCopyWith<$Res> {
  factory _$$onTappedEyeIconLoginEventImplCopyWith(
          _$onTappedEyeIconLoginEventImpl value,
          $Res Function(_$onTappedEyeIconLoginEventImpl) then) =
      __$$onTappedEyeIconLoginEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$onTappedEyeIconLoginEventImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$onTappedEyeIconLoginEventImpl>
    implements _$$onTappedEyeIconLoginEventImplCopyWith<$Res> {
  __$$onTappedEyeIconLoginEventImplCopyWithImpl(
      _$onTappedEyeIconLoginEventImpl _value,
      $Res Function(_$onTappedEyeIconLoginEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$onTappedEyeIconLoginEventImpl implements _onTappedEyeIconLoginEvent {
  _$onTappedEyeIconLoginEventImpl();

  @override
  String toString() {
    return 'LoginEvent.onTappedEyeIcon()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onTappedEyeIconLoginEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String email, String password, BuildContext context)
        onTappedLogIn,
    required TResult Function() onTappedEyeIcon,
  }) {
    return onTappedEyeIcon();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, BuildContext context)?
        onTappedLogIn,
    TResult? Function()? onTappedEyeIcon,
  }) {
    return onTappedEyeIcon?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, BuildContext context)?
        onTappedLogIn,
    TResult Function()? onTappedEyeIcon,
    required TResult orElse(),
  }) {
    if (onTappedEyeIcon != null) {
      return onTappedEyeIcon();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onTappedSaveLoginEvent value) onTappedLogIn,
    required TResult Function(_onTappedEyeIconLoginEvent value) onTappedEyeIcon,
  }) {
    return onTappedEyeIcon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onTappedSaveLoginEvent value)? onTappedLogIn,
    TResult? Function(_onTappedEyeIconLoginEvent value)? onTappedEyeIcon,
  }) {
    return onTappedEyeIcon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onTappedSaveLoginEvent value)? onTappedLogIn,
    TResult Function(_onTappedEyeIconLoginEvent value)? onTappedEyeIcon,
    required TResult orElse(),
  }) {
    if (onTappedEyeIcon != null) {
      return onTappedEyeIcon(this);
    }
    return orElse();
  }
}

abstract class _onTappedEyeIconLoginEvent implements LoginEvent {
  factory _onTappedEyeIconLoginEvent() = _$onTappedEyeIconLoginEventImpl;
}

/// @nodoc
mixin _$LoginState {
  bool get isAuthenticating => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  bool get hide => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {bool isAuthenticating, String? errorMessage, String id, bool hide});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthenticating = null,
    Object? errorMessage = freezed,
    Object? id = null,
    Object? hide = null,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hide: null == hide
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isAuthenticating, String? errorMessage, String id, bool hide});
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthenticating = null,
    Object? errorMessage = freezed,
    Object? id = null,
    Object? hide = null,
  }) {
    return _then(_$LoginStateImpl(
      isAuthenticating: null == isAuthenticating
          ? _value.isAuthenticating
          : isAuthenticating // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hide: null == hide
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  _$LoginStateImpl(
      {this.isAuthenticating = false,
      this.errorMessage,
      this.id = '',
      this.hide = true});

  @override
  @JsonKey()
  final bool isAuthenticating;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final bool hide;

  @override
  String toString() {
    return 'LoginState(isAuthenticating: $isAuthenticating, errorMessage: $errorMessage, id: $id, hide: $hide)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.isAuthenticating, isAuthenticating) ||
                other.isAuthenticating == isAuthenticating) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hide, hide) || other.hide == hide));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isAuthenticating, errorMessage, id, hide);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  factory _LoginState(
      {final bool isAuthenticating,
      final String? errorMessage,
      final String id,
      final bool hide}) = _$LoginStateImpl;

  @override
  bool get isAuthenticating;
  @override
  String? get errorMessage;
  @override
  String get id;
  @override
  bool get hide;
  @override
  @JsonKey(ignore: true)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
