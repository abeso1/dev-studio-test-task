import 'package:flutter/material.dart';

// Primary colors
const Color primary = Color(0xFF3F4A5E);
const Color secondary = Color(0xFF75563D);
const Color tertiary = Color(0xFF414042);

const Color lightest = Color(0xFFFFFFFF);
const Color darkest = Color(0xFF181B25);
const Color darker = Color(0xFF0E121B);
const Color dark = Color(0xFF414042);
const Color bodyLargeColor = Color(0xFF525866);
const Color lightGreyColor = Color(0xFF717784);
const Color lightThemeLabelColor = Color(0xFF2D2D2D);

// Light color scheme
const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  error: Colors.red,
  onError: lightest,
  onPrimary: lightest,
  onPrimaryContainer: lightest,
  onSecondary: darkest,
  onSecondaryContainer: Color(0xFF663900),
  onSurface: darkest,
  onSurfaceVariant: darkest,
  primary: primary,
  secondary: secondary,
  tertiary: tertiary,
  surface: lightest,
  surfaceContainer: Color(0xFFEFEBE8),
  surfaceContainerHighest: Colors.white,
);
