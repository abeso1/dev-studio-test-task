import 'package:flutter/material.dart';

// Extension on BuildContext to access the theme and color scheme
extension Context on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  void closeKeyboard() => FocusScope.of(this).unfocus();
}
