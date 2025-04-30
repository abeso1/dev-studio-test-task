import 'dart:ui';

import 'package:flutter/material.dart';

// Custom scroll behavior for the app so that we can scroll on touchpads
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}
