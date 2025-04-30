import 'dart:io';

import 'package:dev_studio_test_task/core/style/colors.dart';
import 'package:dev_studio_test_task/core/style/text_style.dart';
import 'package:flutter/material.dart';

final lightTheme = _getTheme(brightness: Brightness.light);

/// Returns a [ThemeData] object for the given brightness.
/// Here we set all the theme data for the theme based on the brightness.
ThemeData _getTheme({required Brightness brightness}) {
  final isAndroid = Platform.isAndroid;

  final ColorScheme(
    :onPrimary,
    :primary,
    :surface,
    :surfaceContainerHighest,
    :onSurface,
    :outline,
    :primaryContainer,
    :secondary,
  ) = lightColorScheme;

  final textTheme = getTextTheme(lightColorScheme);
  final TextTheme(
    :titleLarge,
    :titleMedium,
    :titleSmall,
    :bodyMedium,
    :bodyLarge,
  ) = textTheme;

  final primaryTextTheme = textTheme.apply(
    bodyColor: onPrimary,
    displayColor: onPrimary,
  );

  const buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(100)),
  );
  final buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
    letterSpacing: -0.02,
    fontFamily: interFontFamily,
  );

  const noSplashButtonStyle = ButtonStyle(
    splashFactory: NoSplash.splashFactory,
  );

  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: surface,
      titleTextStyle: titleLarge,
    ),
    brightness: brightness,
    colorScheme: lightColorScheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        elevation: 0,
        foregroundColor: onPrimary,
        padding: EdgeInsets.zero,
        shape: buttonShape,
        textStyle: buttonTextStyle,
      ).merge(noSplashButtonStyle),
    ),
    fontFamily: interFontFamily,
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: tertiary.withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      contentPadding: EdgeInsets.only(top: 12),
      fillColor: Colors.transparent,
      filled: true,
      floatingLabelBehavior:
          isAndroid ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,
      hintStyle: bodyLarge,
      prefixIconColor: tertiary,
    ),
    primaryTextTheme: primaryTextTheme,
    scaffoldBackgroundColor: surface,
    textTheme: textTheme,
    useMaterial3: true,
  );
}
