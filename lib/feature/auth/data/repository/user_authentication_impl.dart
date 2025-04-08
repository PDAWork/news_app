// Project imports:
import 'package:news_app/core/utils/exception/user_authentication.dart';
import 'package:news_app/db/dao/user.dart';
import 'package:news_app/feature/auth/data/local_storage/user_authentication_local_storage.dart';
import 'package:news_app/feature/auth/domain/entity/user_entity.dart';
import 'package:news_app/feature/auth/domain/mapper/user_mapper.dart';
import 'package:news_app/feature/auth/domain/repository/user_authentication.dart';

final class UserAuthenticationImpl implements UserAuthentication {
  UserAuthenticationImpl({
    required UserAuthenticationLocalStorage userAuthenticationLocalStorage,
    required UserDao userDao,
  })  : _userDao = userDao,
        _userAuthenticationLocalStorage = userAuthenticationLocalStorage;

  final UserAuthenticationLocalStorage _userAuthenticationLocalStorage;
  final UserDao _userDao;

  @override
  Future<UserEntity> signIn({
    required String email,
    required String password,
  }) async {
    final user = await _userDao.findByUser(email);

    if (user == null) {
      throw NotFoundUserException();
    }

    if (user.password != password) {
      throw InvalidPasswordException();
    }

    await _userAuthenticationLocalStorage.save(user.id);

    return user.entity;
  }

  @override
  Future<UserEntity> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    if (name.length < 3 || email.length < 3) {
      throw InvalidSaveException();
    }

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      throw InvalidSaveException();
    }

    final result = await _userDao.findByUser(email);

    if (result != null) {
      throw DuplicateUserException();
    }

    final user = UserEntity(name: name, email: email, password: password);
    final userId = await _userDao.save(user.dao);
    await _userAuthenticationLocalStorage.save(userId);
    return user;
  }
}
