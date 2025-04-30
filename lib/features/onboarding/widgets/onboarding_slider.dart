import 'package:dev_studio_test_task/features/setup/ui/setup_page.dart';
import 'package:dev_studio_test_task/features/onboarding/widgets/animated_page_indicator.dart';
import 'package:dev_studio_test_task/features/onboarding/widgets/onboarding_slide.dart';
import 'package:dev_studio_test_task/features/onboarding/widgets/sign_in_prompt_text.dart';
import 'package:dev_studio_test_task/shared/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingSlider extends StatefulWidget {
  const OnboardingSlider({super.key});

  @override
  State<OnboardingSlider> createState() => _OnboardingSliderState();
}

class _OnboardingSliderState extends State<OnboardingSlider> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<OnboardingSlide> _slides = [
    OnboardingSlide(
      title: 'Discover yourself\nThrough the Stars',
      subtitle:
          'Explore self-awareness through\nastrology. Navigate life with clarity.',
    ),
    // TODO: Add proper second slide title and subtitle
    OnboardingSlide(
      title: 'This is the second slide text here',
      subtitle: 'This is the second slide subtitle text here that is long',
    ),
    // TODO: Add proper third slide title and subtitle
    OnboardingSlide(
      title: 'This is the third slide text here ',
      subtitle: 'This is the third slide subtitle text here that is long',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 350,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          AnimatedPageIndicator(currentIndex: _currentPage, count: 3),
          SizedBox(
            height: 165,
            child: PageView(
              physics: AlwaysScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: _slides,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppElevatedButton(
              onPressed: () {
                HapticFeedback.lightImpact();

                if (_currentPage == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SetupPage()),
                  );
                } else {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(_currentPage == 2 ? 'Get Started' : 'Continue'),
            ),
          ),
          SizedBox(height: 16),
          SignInPromptText(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
