import 'package:dev_studio_test_task/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AnimatedPageIndicator extends StatelessWidget {
  final int currentIndex;
  final int count;

  const AnimatedPageIndicator({
    super.key,
    required this.currentIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count, (index) {
          final isActive = index == currentIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 2),
            width: isActive ? 16 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: context.colorScheme.secondary.withValues(
                alpha: isActive ? 1 : 0.2,
              ),
              borderRadius: BorderRadius.circular(39),
            ),
          );
        }),
      ),
    );
  }
}
