import 'dart:async';

import 'package:easy_prank_call/easy_prank_call.dart';
import 'package:easy_prank_call/src/easy_prank_call_controller.dart';
import 'package:easy_prank_call/src/models/call_settings_model.dart';
import 'package:easy_prank_call/src/screens/audio_call/components/audio_call_accepted_container.dart';
import 'package:easy_prank_call/src/utilities/my_audio_player.dart';
import 'package:easy_prank_call/src/utilities/my_vibrator.dart';
import 'package:easy_prank_call/src/utilities/size_config.dart';
import 'package:easy_prank_call/src/widgets/call_incoming_container.dart';
import 'package:easy_prank_call/src/widgets/countdown_timer.dart';
import 'package:easy_prank_call/src/widgets/dial_user_pic.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final CallSettingsModel model;
  const Body(this.model, {super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isCallAccepted = false;
  bool _isCallEnded = false;
  Timer? callRingingTimer;

  @override
  void initState() {
    MyAudioPlayer.instance.playRingtone();
    callRingingTimer = Timer(const Duration(minutes: 1), _onPressedEnd);

    if (widget.model.isVibrationOn) MyVibrator.ringtoneVibrate();

    super.initState();
  }

  @override
  void dispose() {
    _stopServices();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              widget.model.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isCallEnded ? 0.4 : 1,
              child: _getCallStatus(),
            ),
            const VerticalSpacing(),
            _isCallAccepted
                ? DialUserPic(image: widget.model.avatarImgPath)
                : DialUserPicAnimated(image: widget.model.avatarImgPath),
            const Spacer(),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isCallEnded ? 0.4 : 1,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  AnimatedOpacity(
                    opacity: _isCallAccepted ? 0 : 1,
                    duration: const Duration(milliseconds: 300),
                    child: CallIncomingContainer(
                      onPressAccept: _onPressedAccept,
                      onPressEnd: _onPressedEnd,
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: _isCallAccepted ? 1 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: AudioCallAcceptedContainer(
                      onPressEnd: _onPressedEnd,
                      onPressDialButton: onPressDialButton,
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpacing(of: 50),
          ],
        ),
      ),
    );
  }

  void onPressDialButton() {
    final controller = EasyPrankCallController.of(context);
    if (controller.onTapEvent != null) {
      controller.onTapEvent!
          .call(context, PrankCallEventAction.callScreenEvent);
    }
  }

  Widget _getCallStatus() {
    if (_isCallEnded) {
      return const Text('call ending...');
    } else if (_isCallAccepted) {
      return const CountDownTimer();
    } else {
      return const Text("Calling…");
    }
  }

  void _stopServices() {
    MyAudioPlayer.instance.stopRingtone();
    MyVibrator.stop();
    callRingingTimer?.cancel();
    callRingingTimer = null;
  }

  void _onPressedEnd() {
    _stopServices();

    setState(() => _isCallEnded = true);
    final controller = EasyPrankCallController.of(context);
    BuildContext cxt = context;

    if (controller.isLaunchFullScreen) {
      cxt = controller.parentContext;
    }

    Future.delayed(const Duration(seconds: 3), () {
      controller.onTapEvent?.call(context, PrankCallEventAction.callEnd);
      if (Navigator.canPop(cxt)) Navigator.pop(cxt);
    });
  }

  void _onPressedAccept() {
    _stopServices();

    setState(() => _isCallAccepted = true);

    EasyPrankCallController.of(context)
        .onTapEvent
        ?.call(context, PrankCallEventAction.callAccept);
  }
}
