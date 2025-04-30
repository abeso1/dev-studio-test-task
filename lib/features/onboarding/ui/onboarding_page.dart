import 'package:dev_studio_test_task/core/extensions/context_extension.dart';
import 'package:dev_studio_test_task/features/onboarding/widgets/onboarding_slider.dart';
import 'package:flutter/material.dart';

class OnboardingIntroPage extends StatelessWidget {
  const OnboardingIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildBackgroundGradient(),
          Positioned(
            bottom: 34,
            left: 20,
            right: 20,
            top: 20,
            child: Column(
              children: [
                Spacer(flex: 2),
                _buildLogo(),
                SizedBox(height: 20),
                Text(
                  'RISING WOMAN',
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleLarge,
                ),
                SizedBox(height: 12),
                Text(
                  'EMBRACE YOUR SHADOWS\nEMBODY LIGHT',
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodySmall,
                ),
                Spacer(),
                OnboardingSlider(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Image _buildLogo() {
    return Image.asset(
      'assets/images/onboarding/logo.png',
      fit: BoxFit.fill,
      height: 104,
      width: 104,
    );
  }

  Container _buildBackgroundGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xFFFAF4F0), Color(0xFFFAF4F0).withValues(alpha: 0)],
        ),
      ),
    );
  }

  Image _buildBackgroundImage() {
    return Image.asset(
      'assets/images/onboarding/intro_background.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }
}
