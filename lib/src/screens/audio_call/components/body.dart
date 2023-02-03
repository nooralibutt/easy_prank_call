import 'package:easy_prank_call/src/easy_prank_call_controller.dart';
import 'package:easy_prank_call/src/screens/audio_call/components/audio_call_accepted_container.dart';
import 'package:easy_prank_call/src/utilities/my_audio_player.dart';
import 'package:easy_prank_call/src/utilities/my_vibrator.dart';
import 'package:easy_prank_call/src/utilities/size_config.dart';
import 'package:easy_prank_call/src/widgets/call_incoming_container.dart';
import 'package:easy_prank_call/src/widgets/countdown_timer.dart';
import 'package:easy_prank_call/src/widgets/dial_user_pic.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final bool isVibrationOn;

  const Body(this.isVibrationOn, {super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isCallAccepted = false;
  bool _isCallEnded = false;

  @override
  void initState() {
    MyAudioPlayer.instance.playRingtone();

    if (widget.isVibrationOn) MyVibrator.ringtoneVibrate();

    super.initState();
  }

  @override
  void dispose() {
    _stopRingtone();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = EasyPrankCallController.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              controller.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isCallEnded ? 0.4 : 1,
              child: _getCallStatus(),
            ),
            const VerticalSpacing(),
            _isCallAccepted
                ? DialUserPic(image: controller.avatarImgPath)
                : DialUserPicAnimated(image: controller.avatarImgPath),
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
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: _isCallAccepted ? 1 : 0,
                    duration: const Duration(milliseconds: 300),
                    child:
                        AudioCallAcceptedContainer(onPressEnd: _onPressedEnd),
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

  Widget _getCallStatus() {
    if (_isCallEnded) {
      return const Text('call ending...');
    } else if (_isCallAccepted) {
      return const CountDownTimer();
    } else {
      return const Text("Calling…");
    }
  }

  void _stopRingtone() {
    MyAudioPlayer.instance.stopRingtone();
    MyVibrator.stop();
  }

  void _onPressedEnd() {
    setState(() => _isCallEnded = true);

    Future.delayed(const Duration(seconds: 3), () => Navigator.pop(context));
  }

  void _onPressedAccept() {
    _stopRingtone();

    setState(() => _isCallAccepted = true);
  }
}
