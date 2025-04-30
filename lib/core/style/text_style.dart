import 'package:dev_studio_test_task/core/style/colors.dart';
import 'package:flutter/material.dart';

const interFontFamily = 'Inter';
const tiemposHeadlineFontFamily = 'Tiempos Headline';
const rufinaFontFamily = 'Rufina';

TextTheme getTextTheme(ColorScheme colorScheme) {
  final bodyMediumColor = darker;
  const bodyWeight = FontWeight.w400;
  const bodyHeight = 1.5;
  const bodyLetterSpacing = 0.0;

  final textTheme = TextTheme(
    // Body
    bodyLarge: TextStyle(
      color: bodyLargeColor,
      fontSize: 16,
      fontWeight: bodyWeight,
      height: 24 / 16,
      letterSpacing: -0.02,
      fontFamily: interFontFamily,
    ),
    bodyMedium: TextStyle(
      color: bodyMediumColor,
      fontSize: 14,
      fontWeight: bodyWeight,
      height: bodyHeight,
      letterSpacing: bodyLetterSpacing,
    ),
    bodySmall: TextStyle(
      color: tertiary.withValues(alpha: 0.8),
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 20 / 14,
      letterSpacing: 2,
      fontFamily: interFontFamily,
    ),

    // Label
    labelLarge: TextStyle(
      color: tertiary,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
      letterSpacing: -0.02,
      fontFamily: interFontFamily,
    ),
    labelMedium: TextStyle(
      color: Color(0xFF2B303B),
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 18 / 12,
      letterSpacing: -0.02,
      fontFamily: interFontFamily,
    ),

    // Display
    displaySmall: TextStyle(
      color: darkest,
      fontSize: 32,
      fontWeight: FontWeight.w400,
      fontFamily: tiemposHeadlineFontFamily,
      height: 1,
      letterSpacing: -0.1,
    ),

    // Headline
    headlineMedium: TextStyle(
      color: tertiary,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontFamily: tiemposHeadlineFontFamily,
      height: 28 / 20,
      letterSpacing: -0.2,
    ),
    headlineSmall: TextStyle(
      color: tertiary,
      fontSize: 28,
      fontWeight: FontWeight.w400,
      fontFamily: tiemposHeadlineFontFamily,
      height: 1,
      letterSpacing: -0.1,
    ),

    // Title
    titleLarge: TextStyle(
      color: darker,
      fontSize: 24,
      height: 1,
      fontWeight: FontWeight.bold,
      fontFamily: rufinaFontFamily,
      letterSpacing: -0.2,
    ),
    titleSmall: TextStyle(
      color: lightGreyColor,
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.1,
      fontFamily: interFontFamily,
    ),
  );

  return textTheme;
}
