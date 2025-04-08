// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:news_app/feature/auth/domain/entity/user_entity.dart';
import 'package:news_app/feature/auth/domain/repository/user_authentication.dart';

part 'user_authentication_event.dart';

part 'user_authentication_state.dart';

part 'user_authentication_bloc.freezed.dart';

class UserAuthenticationBloc extends Bloc<UserAuthenticationEvent, UserAuthenticationState> {
  UserAuthenticationBloc({required UserAuthentication userAuthRepository})
      : _userAuthRepository = userAuthRepository,
        super(const UserAuthenticationState.initial()) {
    on<UserAuthenticationEvent>((event, emit) {
      return switch (event) {
        _SignIn() => _signIn(event, emit),
        _SignUp() => _signUp(event, emit),
      };
    });
  }

  final UserAuthentication _userAuthRepository;

  Future<void> _signIn(_SignIn event, Emitter<UserAuthenticationState> emit) async {
    try {
      emit(const UserAuthenticationState.loading());
      final result = await _userAuthRepository.signIn(
        email: event.email,
        password: event.password,
      );
      emit(UserAuthenticationState.success(user: result));
    } catch (error) {
      emit(const UserAuthenticationState.error());
    }
  }

  Future<void> _signUp(_SignUp event, Emitter<UserAuthenticationState> emit) async {
    try {
      emit(const UserAuthenticationState.loading());
      final result = await _userAuthRepository.signUp(
        name: event.name,
        email: event.email,
        password: event.password,
      );
      emit(UserAuthenticationState.success(user: result));
    } catch (error) {
      emit(const UserAuthenticationState.error());
    }
  }
}
