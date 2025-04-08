// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:news_app/di/app_depends.dart';

abstract interface class RouteWrapper {
  Widget wrappedRoute(AppDepends depends);
}
