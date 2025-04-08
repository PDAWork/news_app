// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserAuthenticationEvent {
  String get email;
  String get password;

  /// Create a copy of UserAuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserAuthenticationEventCopyWith<UserAuthenticationEvent> get copyWith =>
      _$UserAuthenticationEventCopyWithImpl<UserAuthenticationEvent>(
          this as UserAuthenticationEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserAuthenticationEvent &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'UserAuthenticationEvent(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class $UserAuthenticationEventCopyWith<$Res> {
  factory $UserAuthenticationEventCopyWith(UserAuthenticationEvent value,
          $Res Function(UserAuthenticationEvent) _then) =
      _$UserAuthenticationEventCopyWithImpl;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$UserAuthenticationEventCopyWithImpl<$Res>
    implements $UserAuthenticationEventCopyWith<$Res> {
  _$UserAuthenticationEventCopyWithImpl(this._self, this._then);

  final UserAuthenticationEvent _self;
  final $Res Function(UserAuthenticationEvent) _then;

  /// Create a copy of UserAuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SignIn implements UserAuthenticationEvent {
  const _SignIn({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  /// Create a copy of UserAuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignInCopyWith<_SignIn> get copyWith =>
      __$SignInCopyWithImpl<_SignIn>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignIn &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'UserAuthenticationEvent.signIn(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$SignInCopyWith<$Res>
    implements $UserAuthenticationEventCopyWith<$Res> {
  factory _$SignInCopyWith(_SignIn value, $Res Function(_SignIn) _then) =
      __$SignInCopyWithImpl;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$SignInCopyWithImpl<$Res> implements _$SignInCopyWith<$Res> {
  __$SignInCopyWithImpl(this._self, this._then);

  final _SignIn _self;
  final $Res Function(_SignIn) _then;

  /// Create a copy of UserAuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_SignIn(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SignUp implements UserAuthenticationEvent {
  const _SignUp(
      {required this.name, required this.email, required this.password});

  final String name;
  @override
  final String email;
  @override
  final String password;

  /// Create a copy of UserAuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignUpCopyWith<_SignUp> get copyWith =>
      __$SignUpCopyWithImpl<_SignUp>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignUp &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, password);

  @override
  String toString() {
    return 'UserAuthenticationEvent.signUp(name: $name, email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$SignUpCopyWith<$Res>
    implements $UserAuthenticationEventCopyWith<$Res> {
  factory _$SignUpCopyWith(_SignUp value, $Res Function(_SignUp) _then) =
      __$SignUpCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String email, String password});
}

/// @nodoc
class __$SignUpCopyWithImpl<$Res> implements _$SignUpCopyWith<$Res> {
  __$SignUpCopyWithImpl(this._self, this._then);

  final _SignUp _self;
  final $Res Function(_SignUp) _then;

  /// Create a copy of UserAuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_SignUp(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$UserAuthenticationState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserAuthenticationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UserAuthenticationState()';
  }
}

/// @nodoc
class $UserAuthenticationStateCopyWith<$Res> {
  $UserAuthenticationStateCopyWith(
      UserAuthenticationState _, $Res Function(UserAuthenticationState) __);
}

/// @nodoc

class Initial extends UserAuthenticationState {
  const Initial() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UserAuthenticationState.initial()';
  }
}

/// @nodoc

class Loading extends UserAuthenticationState {
  const Loading() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UserAuthenticationState.loading()';
  }
}

/// @nodoc

class Success extends UserAuthenticationState {
  const Success({required this.user}) : super._();

  final UserEntity user;

  /// Create a copy of UserAuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Success &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'UserAuthenticationState.success(user: $user)';
  }
}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res>
    implements $UserAuthenticationStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) =
      _$SuccessCopyWithImpl;
  @useResult
  $Res call({UserEntity user});
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

  /// Create a copy of UserAuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
  }) {
    return _then(Success(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

class Error extends UserAuthenticationState {
  const Error() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UserAuthenticationState.error()';
  }
}

// dart format on
