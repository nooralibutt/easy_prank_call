import 'package:easy_prank_call/src/widgets/custom_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoCallAcceptedContainer extends StatelessWidget {
  final VoidCallback onPressEnd;
  final VoidCallback? onPressDialButton;

  const VideoCallAcceptedContainer({
    Key? key,
    required this.onPressEnd,
    this.onPressDialButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RoundedButton(
          iconData: CupertinoIcons.mic,
          press: onPressDialButton,
          color: Colors.black,
          iconColor: Colors.white,
        ),
        RoundedButton(
          iconData: CupertinoIcons.phone_down_fill,
          press: onPressEnd,
          color: Colors.red,
          iconColor: Colors.white,
        ),
        RoundedButton(
          iconData: CupertinoIcons.volume_down,
          press: onPressDialButton,
          color: Colors.black,
          iconColor: Colors.white,
        ),
      ],
    );
  }
}
