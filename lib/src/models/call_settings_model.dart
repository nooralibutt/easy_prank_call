import 'package:easy_prank_call/src/easy_prank_call_controller.dart';

class CallSettingsModel {
  final Duration duration;
  final bool isVibrationOn;
  final EasyPrankCallController controller;

  const CallSettingsModel(this.duration, this.isVibrationOn, this.controller);
}
