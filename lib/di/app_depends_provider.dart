// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:news_app/di/app_depends.dart';

final class AppDependsProvider extends InheritedWidget {
  const AppDependsProvider({
    required super.child,
    required this.depends,
    super.key,
  });

  final AppDepends depends;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static AppDependsProvider? maybeOf(BuildContext context, [bool listen = false]) {
    return listen
        ? context.dependOnInheritedWidgetOfExactType<AppDependsProvider>()
        : context.getInheritedWidgetOfExactType<AppDependsProvider>();
  }

  static AppDepends of(BuildContext context, [bool listen = false]) {
    final result = maybeOf(context, listen);

    assert(result != null, 'No depends found in context');
    return result!.depends;
  }
}
