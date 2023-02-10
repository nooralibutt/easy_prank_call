import 'package:easy_prank_call/src/models/call_settings_model.dart';
import 'package:easy_prank_call/src/screens/video_call/components/body.dart';
import 'package:easy_prank_call/src/widgets/call_scheduler_black_screen.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatelessWidget {
  static const String routeName = "/videoCallScreen";
  final CallSettingsModel model;

  const VideoCallScreen({super.key, required this.model});

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
