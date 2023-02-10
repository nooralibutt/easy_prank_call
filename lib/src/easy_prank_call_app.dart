import 'package:easy_prank_call/src/easy_prank_call_controller.dart';
import 'package:easy_prank_call/src/models/call_settings_model.dart';
import 'package:easy_prank_call/src/screens/audio_call/audio_call_screen.dart';
import 'package:easy_prank_call/src/screens/call_settings/call_settings_screen.dart';
import 'package:easy_prank_call/src/screens/video_call/video_call_screen.dart';
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

  const EasyPrankCallApp({
    Key? key,
    required this.title,
    this.videoPath,
    required this.avatarImgPath,
    this.onTapEvent,
    this.placementBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return EasyPrankCallController(
      title: title,
      parentContext: context,
      placementBuilder: placementBuilder,
      onTapEvent: onTapEvent,
      context: context,
      avatarImgPath: avatarImgPath,
      videoPath: videoPath,

      /// Package has its own navigation
      child: Navigator(
        initialRoute: CallSettingsScreen.routeName,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case CallSettingsScreen.routeName:
              return _generatePage(const CallSettingsScreen());
            case AudioCallScreen.routeName:
              return _generatePage(AudioCallScreen(
                  model: settings.arguments as CallSettingsModel));
            case VideoCallScreen.routeName:
              return _generatePage(VideoCallScreen(
                  model: settings.arguments as CallSettingsModel));
          }
          return null;
        },
      ),
    );
  }

  Route _generatePage(child) => MaterialPageRoute(builder: (_) => child);
}
