part of 'user_authentication_bloc.dart';

@freezed
sealed class UserAuthenticationEvent with _$UserAuthenticationEvent {
  const factory UserAuthenticationEvent.signIn({
    required String email,
    required String password,
  }) = _SignIn;

  const factory UserAuthenticationEvent.signUp({
    required String name,
    required String email,
    required String password,
  }) = _SignUp;
}
