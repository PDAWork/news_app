part of 'authentication_bloc.dart';

@freezed
sealed class AuthenticationState with _$AuthenticationState {
  const AuthenticationState._();

  const factory AuthenticationState.initial() = _Initial;

  /// Аутентифицирован.
  const factory AuthenticationState.authenticated({
    required final UserEntity user,
  }) = AuthenticatedAuthenticationState;

  /// В обработке.
  const factory AuthenticationState.inProgress() = InProgress;

  /// Разлогинен.
  const factory AuthenticationState.notAuthenticated() = NotAuthenticated;

  const factory AuthenticationState.error() = _Error;

  bool get isAuthenticated => this is AuthenticatedAuthenticationState;
}
