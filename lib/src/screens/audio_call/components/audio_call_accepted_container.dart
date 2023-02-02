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
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: [
            DialButton(
              iconSrc: "assets/icons/Icon Mic.svg",
              text: "Audio",
              press: () {},
            ),
            DialButton(
              iconSrc: "assets/icons/Icon Volume.svg",
              text: "Microphone",
              press: () {},
            ),
            DialButton(
              iconSrc: "assets/icons/Icon Video.svg",
              text: "Video",
              press: () {},
            ),
            DialButton(
              iconSrc: "assets/icons/Icon Message.svg",
              text: "Message",
              press: () {},
            ),
            DialButton(
              iconSrc: "assets/icons/Icon User.svg",
              text: "Add contact",
              press: () {},
            ),
            DialButton(
              iconSrc: "assets/icons/Icon Voicemail.svg",
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
