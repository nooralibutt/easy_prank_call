import 'package:easy_prank_call/src/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

class VideoCallAcceptedContainer extends StatelessWidget {
  final VoidCallback onPressEnd;

  const VideoCallAcceptedContainer({
    Key? key,
    required this.onPressEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RoundedButton(
          press: () {},
          iconSrc: "assets/icons/Icon Mic.svg",
        ),
        RoundedButton(
          press: onPressEnd,
          color: Colors.red,
          iconColor: Colors.white,
          iconSrc: "assets/icons/call_end.svg",
        ),
        RoundedButton(
          press: () {},
          iconSrc: "assets/icons/Icon Volume.svg",
        ),
      ],
    );
  }
}
