// Package imports:
import 'package:talker/talker.dart';

final logger = IAppLogger();

abstract interface class AppLogger {
  void d(dynamic message, {Object? error, StackTrace? stackTrace});

  void e(dynamic message, {Object? error, StackTrace? stackTrace});

  void i(dynamic message, {Object? error, StackTrace? stackTrace});

  void w(dynamic message, {Object? error, StackTrace? stackTrace});

  void h(dynamic message, {required Object error, StackTrace? stackTrace});
}

final class IAppLogger implements AppLogger {
  IAppLogger();

  final talker = Talker(
    settings: TalkerSettings(
      enabled: true,
      useHistory: true,
      maxHistoryItems: 1000,
      useConsoleLogs: true,
    ),
  );

  @override
  void d(dynamic message, {Object? error, StackTrace? stackTrace}) {
    talker.debug(message, error, stackTrace);
  }

  @override
  void e(dynamic message, {Object? error, StackTrace? stackTrace}) {
    talker.error(message, error, stackTrace);
  }

  @override
  void i(dynamic message, {Object? error, StackTrace? stackTrace}) {
    talker.info(message, error, stackTrace);
  }

  @override
  void w(dynamic message, {Object? error, StackTrace? stackTrace}) {
    talker.warning(message, error, stackTrace);
  }

  @override
  void h(message, {required Object error, StackTrace? stackTrace}) {
    talker.handle(error, stackTrace, message);
  }
}
