import 'package:flutter/services.dart';

class MyVibrator {
  static bool _isRinging = false;

  static void vibrate() {
    HapticFeedback.mediumImpact();
  }

  static void ringtoneVibrate() {
    if (_isRinging) return;
    _isRinging = true;
    _run();
  }

  static Future<void> _run() async {
    while (_isRinging) {
      HapticFeedback.heavyImpact();
      await Future.delayed(const Duration(milliseconds: 200));

      if (!_isRinging) return;
      HapticFeedback.mediumImpact();
      await Future.delayed(const Duration(milliseconds: 500));

      if (!_isRinging) return;
      HapticFeedback.heavyImpact();
      await Future.delayed(const Duration(milliseconds: 200));

      if (!_isRinging) return;
      HapticFeedback.mediumImpact();
      await Future.delayed(const Duration(milliseconds: 500));

      if (!_isRinging) return;
      HapticFeedback.heavyImpact();
      await Future.delayed(const Duration(milliseconds: 200));

      await Future.delayed(const Duration(milliseconds: 1000));
    }
  }

  static void stop() {
    _isRinging = false;
  }
}
