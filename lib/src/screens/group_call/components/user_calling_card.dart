import 'package:easy_prank_call/src/utilities/size_config.dart';
import 'package:easy_prank_call/src/widgets/dial_user_pic.dart';
import 'package:flutter/material.dart';

class UserCallingCard extends StatelessWidget {
  const UserCallingCard({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  final String name, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DialUserPic(
            size: 112,
            image: image,
          ),
          const VerticalSpacing(of: 10),
          Text(
            name,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          const VerticalSpacing(of: 5),
          const Text(
            "Calling…",
            style: TextStyle(color: Colors.white60),
          )
        ],
      ),
    );
  }
}
