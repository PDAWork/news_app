part of 'authentication_bloc.dart';

@freezed
sealed class AuthenticationEvent with _$AuthenticationEvent {

  const factory AuthenticationEvent.login() = _Login;

  const factory AuthenticationEvent.logout() = _Logout;
}
