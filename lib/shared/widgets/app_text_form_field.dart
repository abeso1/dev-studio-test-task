import 'package:dev_studio_test_task/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.hintText,
    required this.validator,
    required this.prefixIcon,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    super.key,
  });

  final String hintText;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final bool autofocus;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: context.textTheme.labelLarge,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
      ),
      autofocus: autofocus,
      validator: validator,
    );
  }
}
