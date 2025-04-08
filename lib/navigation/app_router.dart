// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:news_app/core/bloc/authentication_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

// Project imports:
import 'package:news_app/di/app_depends_provider.dart';
import 'package:news_app/feature/auth/ui/index.dart';
import 'package:news_app/feature/home/ui/screen.dart';
import '../core/logger/logger.dart';

enum AppPath {
  signIn(name: '/'),
  signUp(name: '/sign-up'),
  home(name: '/home');

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
    initialLocation: AppPath.signIn.name,
    redirect: (context, state) async {
      final authBloc = AppDependsProvider.of(context).authenticationBloc;

      // Ждем актуальное состояние аутентификации
      final authState = authBloc.state;

      return switch (authState) {
        AuthenticatedAuthenticationState() => AppPath.home.name,
        _ => null,
      };
    },
    observers: [
      TalkerRouteObserver(logger.talker),
    ],
    routes: [
      GoRoute(
        path: AppPath.signIn.name,
        name: AppPath.signIn.name,
        builder: (context, state) => const SignInScreen().wrappedRoute(AppDependsProvider.of(context)),
      ),
      GoRoute(
        path: AppPath.signUp.name,
        name: AppPath.signUp.name,
        builder: (context, state) => const SignUpScreen().wrappedRoute(AppDependsProvider.of(context)),
      ),
      GoRoute(
        path: AppPath.home.name,
        name: AppPath.home.name,
        builder: (context, state) => const HomeScreen().wrappedRoute(AppDependsProvider.of(context)),
      ),
    ],
  );
}
