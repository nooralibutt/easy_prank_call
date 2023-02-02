import 'package:easy_prank_call/src/utilities/size_config.dart';
import 'package:easy_prank_call/src/widgets/call_button.dart';
import 'package:easy_prank_call/src/widgets/custom_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallIncomingContainer extends StatelessWidget {
  final VoidCallback onPressAccept;

  const CallIncomingContainer({Key? key, required this.onPressAccept})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CallButton(
              text: "Remind Me",
              press: () {},
              iconData: CupertinoIcons.alarm_fill,
            ),
            CallButton(
              text: "Message",
              press: () {},
              iconData: CupertinoIcons.chat_bubble_fill,
            ),
          ],
        ),
        const VerticalSpacing(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoundedButton2(
              iconData: CupertinoIcons.phone_down_fill,
              press: () => Navigator.pop(context),
              color: Colors.red,
              iconColor: Colors.white,
            ),
            RoundedButton2(
              iconData: CupertinoIcons.phone_fill,
              press: onPressAccept,
              color: Colors.green,
              iconColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}
