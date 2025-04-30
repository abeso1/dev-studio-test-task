import 'package:haptic_feedback/haptic_feedback.dart';

class HapticFeedback {
  static void lightFeedback() {
    Haptics.vibrate(HapticsType.light);
  }
}
