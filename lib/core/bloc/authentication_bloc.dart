// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:news_app/db/dao/user.dart';
import 'package:news_app/feature/auth/data/local_storage/user_authentication_local_storage.dart';
import 'package:news_app/feature/auth/domain/entity/user_entity.dart';
import 'package:news_app/feature/auth/domain/mapper/user_mapper.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

part 'authentication_bloc.freezed.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required UserAuthenticationLocalStorage userAuthenticationLocalStorage,
    required UserDao userDao,
    AuthenticationState? authenticationState,
  })  : _userAuthenticationLocalStorage = userAuthenticationLocalStorage,
        _userDao = userDao,
        super(authenticationState ?? const AuthenticationState.initial()) {
    on<AuthenticationEvent>(
      (event, emit) {
        return switch (event) {
          _Login() => _onLogin(event, emit),
          _Logout() => _onLogout(event, emit),
        };
      },
    );
  }

  final UserAuthenticationLocalStorage _userAuthenticationLocalStorage;
  final UserDao _userDao;

  static Future<AuthenticationState> _onInit({
    required UserAuthenticationLocalStorage userAuthenticationLocalStorage,
    required UserDao userDao,
  }) async {
    try {
      final userId = userAuthenticationLocalStorage.getUserId();

      if (userId == null) {
        return const AuthenticationState.notAuthenticated();
      }

      final user = await userDao.getUser(userId);

      if (user == null) {
        return const AuthenticationState.notAuthenticated();
      }

      return AuthenticationState.authenticated(user: user.entity);
    } catch (e) {
      return const AuthenticationState.error();
    }
  }

  static Future<AuthenticationBloc> init({
    required UserAuthenticationLocalStorage userAuthenticationLocalStorage,
    required UserDao userDao,
  }) async {
    final stateResult = await _onInit(
      userAuthenticationLocalStorage: userAuthenticationLocalStorage,
      userDao: userDao,
    );
    return AuthenticationBloc(
      userAuthenticationLocalStorage: userAuthenticationLocalStorage,
      userDao: userDao,
      authenticationState: stateResult,
    );
  }

  Future<void> _onLogin(_Login event, Emitter<AuthenticationState> emit) async {
    final userId = _userAuthenticationLocalStorage.getUserId();
    if (userId == null) {
      emit(const AuthenticationState.notAuthenticated());
      return;
    }

    final user = await _userDao.getUser(userId);

    if (user == null) {
      emit(const AuthenticationState.notAuthenticated());
      return;
    }

    emit(AuthenticationState.authenticated(user: user.entity));
  }

  Future<void> _onLogout(_Logout event, Emitter<AuthenticationState> emit) async {}
}
