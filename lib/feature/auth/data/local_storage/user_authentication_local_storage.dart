// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

const String _userIdKey = 'userId';

final class UserAuthenticationLocalStorage {
  const UserAuthenticationLocalStorage(this.preferences);

  final SharedPreferences preferences;

  Future<void> save(int userId) {
    return preferences.setInt(_userIdKey, userId);
  }

  int? getUserId() {
    return preferences.getInt(_userIdKey);
  }
}
