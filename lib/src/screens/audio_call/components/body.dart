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
  _BodyState createState() => _BodyState();
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Scary Teacher Prank',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isCallEnded ? 0.4 : 1,
              child: _getCallStatus(),
            ),
            const VerticalSpacing(),
            _isCallAccepted
                ? const DialUserPic(image: "assets/images/calling_face.jpg")
                : const DialUserPicAnimated(
                    image: "assets/images/calling_face.jpg"),
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
      return CountDownTimer();
    } else {
      return const Text("Calling…");
    }
  }

  _stopRingtone() {
    MyAudioPlayer.instance.stopRingtone();
    MyVibrator.stop();
  }

  _onPressedEnd() {
    setState(() {
      _isCallEnded = true;
    });

    Future.delayed(const Duration(seconds: 3), () => Navigator.pop(context));
  }

  _onPressedAccept() {
    _stopRingtone();

    setState(() {
      _isCallAccepted = true;
    });
  }
}
