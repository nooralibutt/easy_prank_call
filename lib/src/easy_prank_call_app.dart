import 'package:easy_prank_call/src/easy_prank_call_controller.dart';
import 'package:easy_prank_call/src/models/call_settings_model.dart';
import 'package:easy_prank_call/src/utilities/my_audio_player.dart';
import 'package:easy_prank_call/src/utilities/size_config.dart';
import 'package:flutter/material.dart';

import 'screens/call_settings/call_settings_screen.dart';

class EasyPrankCallApp extends StatelessWidget {
  /// This is the main title text
  final String title;

  /// This is path of image that will be shown on the incoming audio call of the prankster
  final String avatarImgPath;

  /// This is path of video that will be shown on the incoming video call of the prankster
  final String? videoPath;

  /// [placementBuilder] is used to build your custom widget at specific places
  final PlacementBuilder? placementBuilder;

  /// [onTapEvent] will be call on every event preformed by the user
  final EventActionCallback? onTapEvent;

  /// You can pass your own ringtone. It could be a url or asset path
  final String? ringtonePath;

  /// [skipCallSettings] is by default is false, if true , it will launch direct
  /// call screen
  final bool skipCallSettings;

  /// This [callSetting] is used for call
  /// [isAudioCall] is by default is true
  /// [skipCallSetting] is by default is false, if true , it will launch direct
  /// call screen
  /// [callScheduleDuration] is by default is 0.s, it will use to launch call
  /// after the given duration
  final CallSetting? callSetting;

  const EasyPrankCallApp({
    Key? key,
    required this.title,
    this.videoPath,
    required this.avatarImgPath,
    this.onTapEvent,
    this.placementBuilder,
    this.ringtonePath = 'assets/audio/ios_call_opening.mp3',
    this.skipCallSettings = false,
    this.callSetting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (ringtonePath != null) MyAudioPlayer.instance.init(ringtonePath);

    return EasyPrankCallController(
        title: title,
        parentContext: context,
        placementBuilder: placementBuilder,
        onTapEvent: onTapEvent,
        context: context,
        avatarImgPath: avatarImgPath,
        videoPath: videoPath,
        ringtonePath: ringtonePath,
        callSetting: callSetting ?? CallSetting(),
        skipCallSetting: skipCallSettings,
        child: _moveToCallScreen());
  }

  Widget _moveToCallScreen() {
    return Builder(builder: (context) {
      final controller = EasyPrankCallController.of(context);
      if (skipCallSettings) {
        return controller.moveToNextScreen(context);
      } else {
        return CallSettingsScreen(controller);
      }
    });
  }
}
