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
              press: () {},
            ),
            DialButton(
              iconData: CupertinoIcons.volume_down,
              isDarkMode: isDarkMode,
              text: "Microphone",
              press: () {},
            ),
            DialButton(
              iconData: CupertinoIcons.video_camera,
              isDarkMode: isDarkMode,
              text: "Video",
              press: () {},
            ),
            DialButton(
              iconData: CupertinoIcons.text_bubble,
              isDarkMode: isDarkMode,
              text: "Message",
              press: () {},
            ),
            DialButton(
              iconData: CupertinoIcons.person_add,
              isDarkMode: isDarkMode,
              text: "Add contact",
              press: () {},
            ),
            DialButton(
              iconData: Icons.voicemail,
              isDarkMode: isDarkMode,
              text: "Voice mail",
              press: () {},
            ),
          ],
        ),
        const VerticalSpacing(),
        RoundedButton2(
          iconData: CupertinoIcons.phone_down_fill,
          press: onPressEnd,
          color: Colors.red,
          iconColor: Colors.white,
        ),
      ],
    );
  }
}
