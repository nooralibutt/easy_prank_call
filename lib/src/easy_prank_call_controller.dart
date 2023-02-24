import 'package:easy_prank_call/src/models/call_settings_model.dart';
import 'package:easy_prank_call/src/models/enums.dart';
import 'package:easy_prank_call/src/screens/audio_call/audio_call_screen.dart';
import 'package:easy_prank_call/src/screens/video_call/video_call_screen.dart';
import 'package:flutter/material.dart';

typedef PlacementBuilder = Widget Function(BuildContext, PrankCallPlacement);
typedef EventActionCallback = void Function(BuildContext, PrankCallEventAction);

class EasyPrankCallController extends InheritedWidget {
  const EasyPrankCallController({
    super.key,
    required this.title,
    required this.avatarImgPath,
    required this.parentContext,
    this.videoPath,
    required super.child,
    this.placementBuilder,
    this.onTapEvent,
    required this.context,
    required this.ringtonePath,
    required this.callSetting,
  });
  final String? ringtonePath;

  /// This is the main title text
  final BuildContext parentContext;

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

  /// This [callSetting] is used for call
  /// [isVibrationOn] is by default is true
  /// [isAudioCall] is by default is true
  /// [callScheduleDuration] is by default is 0.s, it will use to launch call
  /// after the given duration
  final CallSetting callSetting;

  final BuildContext context;

  static EasyPrankCallController? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<EasyPrankCallController>();
  }

  static EasyPrankCallController of(BuildContext context) {
    final EasyPrankCallController? result = maybeOf(context);
    assert(result != null, 'No controller found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(EasyPrankCallController oldWidget) =>
      title != oldWidget.title;

  Widget moveToNextScreen(BuildContext context) {
    final controller = EasyPrankCallController.of(context);
    return callSetting.callType == EasyCallType.audio
        ? AudioCallScreen(controller: controller)
        : VideoCallScreen(controller: controller);
  }
}
