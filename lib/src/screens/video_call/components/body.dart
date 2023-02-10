import 'package:easy_prank_call/easy_prank_call.dart';
import 'package:easy_prank_call/src/easy_prank_call_controller.dart';
import 'package:easy_prank_call/src/screens/video_call/components/camera_preview_widget.dart';
import 'package:easy_prank_call/src/screens/video_call/components/video_call_accepted.dart';
import 'package:easy_prank_call/src/utilities/my_audio_player.dart';
import 'package:easy_prank_call/src/utilities/my_vibrator.dart';
import 'package:easy_prank_call/src/utilities/size_config.dart';
import 'package:easy_prank_call/src/widgets/call_incoming_container.dart';
import 'package:easy_prank_call/src/widgets/countdown_timer.dart';
import 'package:easy_prank_call/src/widgets/dial_user_pic.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Body extends StatefulWidget {
  final bool isVibrationOn;
  final EasyPrankCallController controller;
  const Body(this.isVibrationOn, this.controller, {super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isCallAccepted = false;
  bool _isCallEnded = false;
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    MyAudioPlayer.instance.playRingtone();
    if (widget.isVibrationOn) MyVibrator.ringtoneVibrate();
    _videoInit();
  }

  void _videoInit() {
    final path = widget.controller.videoPath;
    if (path?.isNotEmpty ?? false) {
      if (path!.startsWith('http')) {
        _videoController = VideoPlayerController.network(path)..initialize();
      } else {
        _videoController = VideoPlayerController.asset(path)..initialize();
      }
      _videoController?.setLooping(true);
    }
  }

  @override
  void dispose() {
    _stopRingtone();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    return Stack(
      fit: StackFit.expand,
      children: [
        _videoController != null &&
                _videoController!.value.isInitialized &&
                _isCallAccepted
            ? SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _videoController?.value.size.width,
                    height: _videoController?.value.size.height,
                    child: VideoPlayer(_videoController!),
                  ),
                ),
              )
            : DialUserPic(image: controller.avatarImgPath),
        DecoratedBox(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.3))),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  controller.title,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.white),
                ),
                const VerticalSpacing(of: 10),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _isCallEnded ? 0.4 : 1,
                  child: _getCallStatus(),
                ),
                const Spacer(),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: CameraApp(),
                ),
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
                      IgnorePointer(
                        ignoring: !_isCallAccepted,
                        child: AnimatedOpacity(
                          opacity: _isCallAccepted ? 1 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: VideoCallAcceptedContainer(
                            onPressEnd: _onPressedEnd,
                            onPressDialButton: onPressDialButton,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void onPressDialButton() {
    final controller = widget.controller;
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

  void _stopRingtone() {
    MyAudioPlayer.instance.stopRingtone();
    MyVibrator.stop();
  }

  void _onPressedEnd() {
    setState(() {
      _isCallEnded = true;
      _videoController?.pause();
    });

    Future.delayed(const Duration(seconds: 3), () => Navigator.pop(context));

    final controller = widget.controller;
    if (controller.onTapEvent != null) {
      controller.onTapEvent!.call(context, PrankCallEventAction.callEnd);
    }
  }

  void _onPressedAccept() {
    _stopRingtone();

    setState(() {
      _isCallAccepted = true;
      _videoController?.play();
    });

    final controller = widget.controller;
    if (controller.onTapEvent != null) {
      controller.onTapEvent!.call(context, PrankCallEventAction.callAccept);
    }
  }
}
