part of 'user_authentication_bloc.dart';

@freezed
sealed class UserAuthenticationState with _$UserAuthenticationState {
  const UserAuthenticationState._();

  const factory UserAuthenticationState.initial() = Initial;

  const factory UserAuthenticationState.loading() = Loading;

  const factory UserAuthenticationState.success({
    required UserEntity user,
  }) = Success;

  const factory UserAuthenticationState.error() = Error;

  bool get isLoading => this is Loading;

  bool get isError => this is Error;

  bool get isSuccess => this is Success;
}
