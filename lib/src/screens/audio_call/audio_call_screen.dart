import 'package:easy_prank_call/src/models/call_settings_model.dart';
import 'package:easy_prank_call/src/screens/audio_call/components/body.dart';
import 'package:easy_prank_call/src/widgets/call_scheduler_black_screen.dart';
import 'package:flutter/material.dart';

class AudioCallScreen extends StatelessWidget {
  static const String routeName = "/audioCallScreen";
  final CallSettingsModel model;
  const AudioCallScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CallSchedulerBlackScreen(
        duration: model.duration,
        child: Body(model.isVibrationOn, model.controller),
      ),
    );
  }
}
