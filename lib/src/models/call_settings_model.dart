import 'package:easy_prank_call/easy_prank_call.dart';

class CallSetting {
  Duration callScheduleDuration;
  bool isVibrationOn;
  EasyCallType callType;

  CallSetting({
    this.callScheduleDuration = const Duration(seconds: 0),
    this.isVibrationOn = true,
    this.callType = EasyCallType.audio,
  });
}
