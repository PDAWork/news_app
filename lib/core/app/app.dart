// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:news_app/di/app_depends.dart';
import 'package:news_app/di/app_depends_provider.dart';
import 'package:news_app/navigation/app_router.dart';

class App extends StatelessWidget {
  const App({
    required this.depends,
    super.key,
  });

  final AppDepends depends;

  @override
  Widget build(BuildContext context) {
    return AppDependsProvider(
      depends: depends,
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red,
          ),
        ), // Светлая тема
        themeMode: ThemeMode.system, // Автоматическое переключение между светлой и темной темами
      ),
    );
  }
}

class AppError extends StatelessWidget {
  const AppError({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
