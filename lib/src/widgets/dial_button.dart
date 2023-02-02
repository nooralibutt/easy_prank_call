import 'package:easy_prank_call/src/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DialButton extends StatelessWidget {
  const DialButton({
    Key? key,
    required this.iconSrc,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String iconSrc, text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(120),
      child: TextButton(
        style: TextButton.styleFrom(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20)),
        ),
        onPressed: press,
        child: Column(
          children: [
            SvgPicture.asset(
              iconSrc,
              color: Colors.white,
              height: 36,
            ),
            const VerticalSpacing(of: 5),
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
