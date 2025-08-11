import 'package:easy_prank_call/src/easy_prank_call_controller.dart';
import 'package:easy_prank_call/src/models/call_settings_model.dart';
import 'package:easy_prank_call/src/models/enums.dart';
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

  /// [isVibrationOn] is by default is true
  final bool isVibrationOn;

  /// [callScheduleDuration] is by default is 0.s, it will use to launch call
  /// after the given duration
  final Duration callScheduleDuration;

  /// [callType] is by default is true
  final EasyCallType callType;

  const EasyPrankCallApp({
    super.key,
    required this.title,
    this.videoPath,
    required this.avatarImgPath,
    this.onTapEvent,
    this.placementBuilder,
    this.ringtonePath = 'assets/audio/ios_call_opening.mp3',
    this.skipCallSettings = false,
    this.isVibrationOn = true,
    this.callType = EasyCallType.audio,
    this.callScheduleDuration = const Duration(seconds: 0),
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (ringtonePath != null) MyAudioPlayer.instance.init(ringtonePath);

    final callSetting = CallSetting(
      callScheduleDuration: callScheduleDuration,
      callType: callType,
      isVibrationOn: isVibrationOn,
    );

    return EasyPrankCallController(
      title: title,
      parentContext: context,
      placementBuilder: placementBuilder,
      onTapEvent: onTapEvent,
      context: context,
      avatarImgPath: avatarImgPath,
      videoPath: videoPath,
      ringtonePath: ringtonePath,
      callSetting: callSetting,
      child: _moveToCallScreen(),
    );
  }

  Widget _moveToCallScreen() {
    return Builder(
      builder: (context) {
        final controller = EasyPrankCallController.of(context);
        if (skipCallSettings) {
          return controller.getCallScreen();
        } else {
          return CallSettingsScreen(controller);
        }
      },
    );
  }
}
