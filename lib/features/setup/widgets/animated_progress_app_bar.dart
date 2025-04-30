import 'package:dev_studio_test_task/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AnimatedProgressAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final int currentStep;
  final int totalSteps;
  final VoidCallback? onBack;

  const AnimatedProgressAppBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.onBack,
  });

  double get _progress => currentStep.clamp(0, totalSteps) / totalSteps;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final percent = (_progress * 100).round();

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 40,
      leading: Padding(
        padding: const EdgeInsets.only(left: 4, top: 10, bottom: 10),
        child: IconButton(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          icon: Center(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
          onPressed: onBack ?? () => Navigator.of(context).maybePop(),
        ),
      ),

      title: Row(
        children: [
          // Spacer for centering progress bar
          Expanded(
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: _progress),
              duration: const Duration(milliseconds: 300),
              builder: (context, value, child) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: LinearProgressIndicator(
                    value: value,
                    minHeight: 6,
                    backgroundColor: context.colorScheme.surfaceContainer,
                    valueColor: AlwaysStoppedAnimation(
                      context.colorScheme.secondary,
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(width: 12),

          // Percentage
          Container(
            height: 24,
            width: 48,
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: Text('$percent%', style: context.textTheme.labelMedium),
            ),
          ),
        ],
      ),
    );
  }
}
