import 'package:dev_studio_test_task/core/extensions/context_extension.dart';
import 'package:dev_studio_test_task/core/haptic/haptic_feedback.dart';
import 'package:dev_studio_test_task/features/setup/widgets/zodiac_wheel.dart';
import 'package:dev_studio_test_task/shared/widgets/app_elevated_button.dart';
import 'package:flutter/cupertino.dart';

class DateOfBirthPage extends StatefulWidget {
  const DateOfBirthPage({required this.onContinue, super.key});

  final VoidCallback onContinue;

  @override
  State<DateOfBirthPage> createState() => _DateOfBirthPageState();
}

class _DateOfBirthPageState extends State<DateOfBirthPage> {
  DateTime selectedDate = DateTime(1990, 9, 10);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            'Date of birth',
            style: context.textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Date is important for determining your\nSun sign, numerology, and compatibility.',
            style: context.textTheme.titleSmall?.copyWith(
              color: context.colorScheme.tertiary.withValues(alpha: 0.8),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          ZodiacWheel(selectedDate: selectedDate),
          SizedBox(height: 16),
          SizedBox(
            height: 145,
            child: CupertinoDatePicker(
              initialDateTime: selectedDate,
              mode: CupertinoDatePickerMode.date,
              use24hFormat: true,
              showDayOfWeek: false,
              onDateTimeChanged: (DateTime newDate) {
                // TODO: Save the selected date
                setState(() => selectedDate = newDate);
              },
              maximumDate: DateTime.now().subtract(Duration(days: 365 * 6)),
            ),
          ),
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
