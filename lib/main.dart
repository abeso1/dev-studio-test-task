import 'package:dev_studio_test_task/core/app_scroll_behavior.dart';
import 'package:dev_studio_test_task/core/style/style.dart';
import 'package:dev_studio_test_task/features/onboarding/ui/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'DEV Studios Test App',
      theme: lightTheme,
      // TODO: Implement proper routing with go_router
      home: const OnboardingIntroPage(),
    );
  }
}
