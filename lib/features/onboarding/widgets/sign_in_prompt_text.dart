import 'package:dev_studio_test_task/core/extensions/context_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInPromptText extends StatelessWidget {
  const SignInPromptText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: context.textTheme.bodyLarge,
        children: [
          TextSpan(text: 'Already have an account? '),
          TextSpan(
            text: 'Sign in',
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    // TODO: Navigate to sign in page
                  },
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
