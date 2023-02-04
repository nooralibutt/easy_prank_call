import 'package:easy_prank_call/src/utilities/size_config.dart';
import 'package:flutter/material.dart';

class CallButton extends StatelessWidget {
  const CallButton({
    Key? key,
    required this.iconData,
    required this.text,
    required this.press,
  }) : super(key: key);

  final IconData iconData;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(120),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20)),
          backgroundColor: Colors.transparent,
        ),
        onPressed: press,
        child: Column(
          children: [
            Icon(
              iconData,
              color: Colors.white,
              size: 20,
            ),
            const VerticalSpacing(of: 10),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
