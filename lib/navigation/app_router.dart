// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

// Project imports:
import 'package:news_app/feature/auth/ui/index.dart';
import '../core/logger/logger.dart';

enum AppPath {
  signIn(name: '/sign-in'),
  signUp(name: '/');

  const AppPath({
    required this.name,
  });

  final String name;
}

final class AppRouter {
  AppRouter();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppPath.signUp.name,
    observers: [
      TalkerRouteObserver(logger.talker),
    ],
    routes: [
      GoRoute(
        path: AppPath.signIn.name,
        name: AppPath.signIn.name,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: AppPath.signUp.name,
        name: AppPath.signUp.name,
        builder: (context, state) => const SignUpScreen(),
      ),
    ],
  );
}
