import 'package:vibration/vibration.dart';

class MyVibrator {
  static ringtoneVibrate() {
    Vibration.vibrate(
      pattern: [200, 500, 200, 500, 200, 1000],
      repeat: 0,
    );
  }

  static void vibrate() => Vibration.vibrate();

  static void stop() => Vibration.cancel();
}
