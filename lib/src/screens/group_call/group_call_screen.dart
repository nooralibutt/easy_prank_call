import 'package:easy_prank_call/src/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/body.dart';

class GroupCallScreen extends StatelessWidget {
  const GroupCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: buildBottomNavBar(context),
    );
  }

  Container buildBottomNavBar(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              RoundedButton(
                // color: AppTheme.kRedColor,
                iconColor: Colors.white,
                size: 48,
                iconSrc: "assets/icons/Icon Close.svg",
                press: () {},
              ),
              const Spacer(flex: 3),
              RoundedButton(
                color: const Color(0xFF2C384D),
                iconColor: Colors.white,
                size: 48,
                iconSrc: "assets/icons/Icon Volume.svg",
                press: () {},
              ),
              const Spacer(),
              RoundedButton(
                color: const Color(0xFF2C384D),
                iconColor: Colors.white,
                size: 48,
                iconSrc: "assets/icons/Icon Mic.svg",
                press: () {},
              ),
              RoundedButton(
                color: const Color(0xFF2C384D),
                iconColor: Colors.white,
                size: 48,
                iconSrc: "assets/icons/Icon Video.svg",
                press: () {},
              ),
              RoundedButton(
                color: const Color(0xFF2C384D),
                iconColor: Colors.white,
                size: 48,
                iconSrc: "assets/icons/Icon Repeat.svg",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/Icon Back.svg"),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/Icon User.svg",
            height: 24,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
