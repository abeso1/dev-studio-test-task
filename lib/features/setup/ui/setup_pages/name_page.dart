import 'package:dev_studio_test_task/core/extensions/context_extension.dart';
import 'package:dev_studio_test_task/core/haptic/haptic_feedback.dart';
import 'package:dev_studio_test_task/shared/widgets/app_elevated_button.dart';
import 'package:dev_studio_test_task/shared/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class NamePage extends StatefulWidget {
  final VoidCallback onContinue;

  const NamePage({super.key, required this.onContinue});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('What\'s your name?', style: context.textTheme.headlineMedium),
          const SizedBox(height: 16),
          Form(
            key: _formKey,
            child: AppTextFormField(
              hintText: 'Your name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
              prefixIcon: Icons.person_outline,
              autofocus: true,
              textCapitalization: TextCapitalization.words,
            ),
          ),
          const Spacer(),
          AppElevatedButton(
            onPressed: () {
              HapticFeedback.lightFeedback();
              if (_formKey.currentState!.validate()) {
                context.closeKeyboard();
                // TODO: Save the name
                widget.onContinue();
              }
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
