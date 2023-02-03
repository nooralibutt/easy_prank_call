import 'package:easy_prank_call/src/models/enums.dart';
import 'package:flutter/material.dart';

typedef PlacementBuilder = Widget Function(BuildContext, WallpaperPlacement);
typedef EventActionCallback = void Function(BuildContext, WallpaperEventAction);

class EasyPrankCallController extends InheritedWidget {
  const EasyPrankCallController({
    super.key,
    required this.title,
    required this.avatarImgPath,
    required this.videoPath,
    required super.child,
    this.placementBuilder,
    this.onTapEvent,
    this.onSetOrDownloadWallpaper,
    required this.context,
  });

  /// This is the main title text
  final String title;

  /// This is path of image that will be shown on the incoming audio call of the prankster
  final String avatarImgPath;

  /// This is path of video that will be shown on the incoming video call of the prankster
  final String videoPath;

  /// [placementBuilder] is used to build your custom widget at specific places
  final PlacementBuilder? placementBuilder;

  /// [onTapEvent] will be call on every event preformed by the user
  final EventActionCallback? onTapEvent;

  /// [onSetOrDownloadWallpaper] will be call when user set or download wallpaper
  final Future<bool> Function(BuildContext)? onSetOrDownloadWallpaper;

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
}
