import 'package:dev_studio_test_task/core/extensions/context_extension.dart';
import 'package:dev_studio_test_task/core/haptic/haptic_feedback.dart';
import 'package:dev_studio_test_task/shared/widgets/app_elevated_button.dart';
import 'package:flutter/cupertino.dart';

class TimeOfBirthPage extends StatefulWidget {
  const TimeOfBirthPage({required this.onContinue, super.key});

  final VoidCallback onContinue;

  @override
  State<TimeOfBirthPage> createState() => _TimeOfBirthPageState();
}

class _TimeOfBirthPageState extends State<TimeOfBirthPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            'Time of birth',
            style: context.textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Time is important for determining your Houses, Rising sign, and the exact Moon position.',
            style: context.textTheme.titleSmall?.copyWith(
              color: Color(0xFF414042).withValues(alpha: 0.8),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          // TODO: Add time picker
          const Spacer(),
          AppElevatedButton(
            onPressed: () {
              HapticFeedback.lightFeedback();
              widget.onContinue();
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
