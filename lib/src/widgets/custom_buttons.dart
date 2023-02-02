import 'package:easy_prank_call/src/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    this.size = 64,
    required this.iconSrc,
    this.color = Colors.white,
    this.iconColor = Colors.black,
    required this.press,
  }) : super(key: key);

  final double size;
  final String iconSrc;
  final Color color, iconColor;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(size),
      width: getProportionateScreenWidth(size),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(15 / 64 * size),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          backgroundColor: color,
        ),
        onPressed: press,
        child: SvgPicture.asset(iconSrc, color: iconColor),
      ),
    );
  }
}

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

class MyRaisedButton2 extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;
  final Color color;

  const MyRaisedButton2(
      {super.key,
      required this.buttonTitle,
      required this.onTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(vertical: 10),
        backgroundColor: color,
      ),
      onPressed: onTap,
      child: Text(
        buttonTitle,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  final Function(BuildContext) onPressed;

  const ContinueButton(this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.greenAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
      onPressed: () => onPressed(context),
      child: SizedBox(
        height: 50.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SizedBox(width: 16.0),
            Text(
              'Next',
              style: TextStyle(
                // color: AppTheme.primary,
                fontSize: 18,
              ),
            ),
            SizedBox(width: 8.0),
            Icon(
              Icons.navigate_next,
              size: 30.0,
              // color: AppTheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
