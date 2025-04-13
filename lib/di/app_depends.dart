// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:news_app/core/bloc/authentication_bloc.dart';
import 'package:news_app/db/app_database.dart';
import 'package:news_app/feature/auth/data/local_storage/user_authentication_local_storage.dart';
import 'package:news_app/feature/auth/data/repository/user_authentication_impl.dart';
import 'package:news_app/feature/auth/domain/repository/user_authentication.dart';
import 'package:news_app/feature/auth/ui/bloc/user_authentication_bloc.dart';

final class AppDepends {
  AppDepends();

  final AppDatabase _appDatabase = AppDatabase();

  late final SharedPreferences _sharedPreferences;

  late final UserAuthenticationLocalStorage _userAuthenticationLocalStorage = UserAuthenticationLocalStorage(
    _sharedPreferences,
  );

  late final UserAuthentication _userAuthenticationRepository = UserAuthenticationImpl(
    userDao: _appDatabase.userDao,
    userAuthenticationLocalStorage: _userAuthenticationLocalStorage,
  );

  UserAuthenticationBloc? _userAuthenticationBloc;

  UserAuthenticationBloc get userAuthenticationBloc =>
      _userAuthenticationBloc ??
      UserAuthenticationBloc(
        userAuthRepository: _userAuthenticationRepository,
      );

  AuthenticationBloc? _authenticationBloc;

  AuthenticationBloc get authenticationBloc =>
      _authenticationBloc ??
      AuthenticationBloc(
        userAuthenticationLocalStorage: _userAuthenticationLocalStorage,
        userDao: _appDatabase.userDao,
      );

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _authenticationBloc = await AuthenticationBloc.init(
      userAuthenticationLocalStorage: _userAuthenticationLocalStorage,
      userDao: _appDatabase.userDao,
    );
  }
}
