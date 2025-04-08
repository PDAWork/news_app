// Flutter imports:
import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  TextTheme get textStyle => Theme.of(this).textTheme;
}
