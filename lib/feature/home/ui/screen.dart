// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:news_app/core/utils/route_wrapper.dart';
import 'package:news_app/di/app_depends.dart';

class HomeScreen extends StatefulWidget implements RouteWrapper {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  Widget wrappedRoute(AppDepends depends) {
    return this;
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
