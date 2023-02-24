import 'package:easy_prank_call/src/easy_prank_call_controller.dart';
import 'package:easy_prank_call/src/screens/video_call/components/body.dart';
import 'package:easy_prank_call/src/widgets/call_scheduler_black_screen.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatelessWidget {
  static const String routeName = "/videoCallScreen";
  final EasyPrankCallController controller;

  const VideoCallScreen({
    super.key,
    required this.controller,
  });

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
