import 'package:easy_prank_call/src/easy_prank_call_controller.dart';
import 'package:easy_prank_call/src/models/enums.dart';
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
        RoundedButton(
          iconData: CupertinoIcons.mic,
          press: () => onTap(context),
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
          press: () => onTap(context),
          color: Colors.black,
          iconColor: Colors.white,
        ),
      ],
    );
  }

  void onTap(BuildContext context) {
    final controller = EasyPrankCallController.of(context);
    if (controller.onTapEvent != null) {
      controller.onTapEvent!
          .call(context, PrankCallEventAction.callScreenEvent);
    }
  }
}
