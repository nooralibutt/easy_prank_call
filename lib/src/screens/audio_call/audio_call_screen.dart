import 'package:easy_prank_call/src/easy_prank_call_controller.dart';
import 'package:easy_prank_call/src/screens/audio_call/components/body.dart';
import 'package:easy_prank_call/src/widgets/call_scheduler_black_screen.dart';
import 'package:flutter/material.dart';

class AudioCallScreen extends StatelessWidget {
  static const String routeName = "/audioCallScreen";
  final EasyPrankCallController controller;
  const AudioCallScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CallSchedulerBlackScreen(
        duration: controller.callScheduleDuration,
        child: Body(controller),
      ),
    );
  }
}
