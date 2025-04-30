import 'package:dev_studio_test_task/features/setup/widgets/animated_progress_app_bar.dart';
import 'package:dev_studio_test_task/core/extensions/context_extension.dart';
import 'package:dev_studio_test_task/core/haptic/haptic_feedback.dart';
import 'package:dev_studio_test_task/features/setup/ui/setup_pages/date_of_birth_page.dart';
import 'package:dev_studio_test_task/features/setup/ui/setup_pages/name_page.dart';
import 'package:dev_studio_test_task/features/setup/ui/setup_pages/time_of_birth_page.dart';
import 'package:flutter/material.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final PageController _pageController = PageController();
  int _currentStep = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _handlePreviousPage() {
    HapticFeedback.lightFeedback();
    context.closeKeyboard();
    if (_currentStep > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            _buildBackground(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedProgressAppBar(
                  currentStep: _currentStep + 1,
                  totalSteps: 10,
                  onBack: _handlePreviousPage,
                ),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentStep = index;
                      });
                    },
                    children: [
                      NamePage(onContinue: _handleNextPage),
                      DateOfBirthPage(onContinue: _handleNextPage),
                      TimeOfBirthPage(onContinue: _handleNextPage),
                      // TODO: Add rest of the pages
                      // These are just pages to show animation works on setup
                      InkWell(onTap: _handleNextPage),
                      InkWell(onTap: _handleNextPage),
                      InkWell(onTap: _handleNextPage),
                      InkWell(onTap: _handleNextPage),
                      InkWell(onTap: _handleNextPage),
                      InkWell(onTap: _handleNextPage),
                      InkWell(onTap: _handleNextPage),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).padding.bottom),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Image _buildBackground() {
    return Image.asset(
      'assets/images/onboarding/background.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      opacity: const AlwaysStoppedAnimation(0.02),
    );
  }
}
