import 'package:easy_prank_call/src/utilities/size_config.dart';
import 'package:flutter/material.dart';

class RoundedButton2 extends StatelessWidget {
  const RoundedButton2({
    Key? key,
    this.size = 80,
    required this.iconData,
    this.color = Colors.white,
    this.iconColor = Colors.black,
    required this.press,
  }) : super(key: key);

  final double size;
  final IconData iconData;
  final Color color, iconColor;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(size),
      width: getProportionateScreenWidth(size),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          backgroundColor: color,
        ),
        onPressed: press,
        child: Icon(
          iconData,
          color: iconColor,
          size: 35,
        ),
      ),
    );
  }
}
