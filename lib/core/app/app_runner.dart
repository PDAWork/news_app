// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

// Project imports:
import 'package:news_app/core/logger/logger.dart';
import 'package:news_app/di/app_depends.dart';
import 'app.dart';

class AppRunner {
  AppRunner();

  Future<void> run() async {
    await runZonedGuarded(() async {
      await _initApp();

      Bloc.observer = TalkerBlocObserver(talker: logger.talker);

      FlutterError.onError = (details) => logger.h(
            '[FlutterError]',
            error: details.exception,
            stackTrace: details.stack,
          );

      final depends = AppDepends();
      await depends.init();

      runApp(
        App(
          depends: depends,
        ),
      );
    }, (error, stackTrace) {
      logger.h('[Zone Error] ', error: error, stackTrace: stackTrace);
      runApp(
        AppError(
          message: 'error: $error,\n stack: $stackTrace',
        ),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      WidgetsBinding.instance.allowFirstFrame();
    });
  }

  Future<void> _initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.deferFirstFrame();
  }
}
