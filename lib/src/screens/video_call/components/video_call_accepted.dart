import 'package:easy_prank_call/src/widgets/custom_buttons.dart';
import 'package:flutter/cupertino.dart';
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
        RoundedButton2(
          iconData: CupertinoIcons.mic,
          press: () {},
          color: Colors.red,
          iconColor: Colors.white,
        ),
        RoundedButton2(
          iconData: CupertinoIcons.phone_down_fill,
          press: onPressEnd,
          color: Colors.red,
          iconColor: Colors.white,
        ),
        RoundedButton2(
          iconData: CupertinoIcons.volume_down,
          press: () {},
          color: Colors.red,
          iconColor: Colors.white,
        ),
      ],
    );
  }
}
