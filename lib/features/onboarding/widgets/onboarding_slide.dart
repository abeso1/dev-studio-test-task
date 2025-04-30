import 'package:dev_studio_test_task/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class OnboardingSlide extends StatelessWidget {
  const OnboardingSlide({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SizedBox(height: 12),
          Text(
            title,
            style: context.textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            subtitle,
            style: context.textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
