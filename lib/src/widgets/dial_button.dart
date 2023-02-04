import 'package:easy_prank_call/src/utilities/size_config.dart';
import 'package:flutter/material.dart';

class DialButton extends StatelessWidget {
  const DialButton({
    Key? key,
    required this.iconData,
    required this.text,
    required this.press,
    required this.isDarkMode,
  }) : super(key: key);

  final IconData iconData;
  final bool isDarkMode;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(120),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenWidth(20),
          ),
        ),
        onPressed: press,
        child: Column(
          children: [
            Icon(
              iconData,
              size: 36,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            const VerticalSpacing(of: 5),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
