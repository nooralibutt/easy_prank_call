import 'package:easy_prank_call/src/easy_prank_call_controller.dart';
import 'package:easy_prank_call/src/models/enums.dart';
import 'package:easy_prank_call/src/utilities/size_config.dart';
import 'package:easy_prank_call/src/widgets/custom_buttons.dart';
import 'package:easy_prank_call/src/widgets/dial_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioCallAcceptedContainer extends StatelessWidget {
  final VoidCallback onPressEnd;

  const AudioCallAcceptedContainer({
    Key? key,
    required this.onPressEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: [
            DialButton(
              iconData: Icons.mic,
              isDarkMode: isDarkMode,
              text: "Audio",
              press: () => onTap(context),
            ),
            DialButton(
              iconData: CupertinoIcons.volume_down,
              isDarkMode: isDarkMode,
              text: "Microphone",
              press: () => onTap(context),
            ),
            DialButton(
              iconData: CupertinoIcons.video_camera,
              isDarkMode: isDarkMode,
              text: "Video",
              press: () => onTap(context),
            ),
            DialButton(
              iconData: CupertinoIcons.text_bubble,
              isDarkMode: isDarkMode,
              text: "Message",
              press: () => onTap(context),
            ),
            DialButton(
              iconData: CupertinoIcons.person_add,
              isDarkMode: isDarkMode,
              text: "Add contact",
              press: () => onTap(context),
            ),
            DialButton(
              iconData: Icons.voicemail,
              isDarkMode: isDarkMode,
              text: "Voice mail",
              press: () => onTap(context),
            ),
          ],
        ),
        const VerticalSpacing(),
        RoundedButton(
          iconData: CupertinoIcons.phone_down_fill,
          press: onPressEnd,
          color: Colors.red,
          iconColor: Colors.white,
        ),
      ],
    );
  }

  void onTap(BuildContext context) {
    final controller = EasyPrankCallController.of(context);
    if (controller.placementBuilder != null) {
      controller.onTapEvent!
          .call(context, PrankCallEventAction.callScreenEvent);
    }
  }
}
