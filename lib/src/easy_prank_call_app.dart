import 'package:easy_prank_call/src/easy_prank_call_controller.dart';
import 'package:easy_prank_call/src/screens/call_settings/call_settings_screen.dart';
import 'package:easy_prank_call/src/utilities/my_audio_player.dart';
import 'package:easy_prank_call/src/utilities/size_config.dart';
import 'package:flutter/material.dart';

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

  final String? ringtonePath;

  const EasyPrankCallApp({
    Key? key,
    required this.title,
    this.videoPath,
    required this.avatarImgPath,
    this.onTapEvent,
    this.placementBuilder,
    this.ringtonePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    MyAudioPlayer.instance.init(ringtonePath);

    return EasyPrankCallController(
      title: title,
      parentContext: context,
      placementBuilder: placementBuilder,
      onTapEvent: onTapEvent,
      context: context,
      avatarImgPath: avatarImgPath,
      videoPath: videoPath,
      ringtonePath: ringtonePath,
      child: const CallSettingsScreen(),
    );
  }
}
