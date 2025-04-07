// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:go_router/go_router.dart' show GoRouter;

final class AppRouter {
  AppRouter();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [],
  );
}
