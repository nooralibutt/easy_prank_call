import 'package:flutter/material.dart';

class MaybeCloseButton extends StatelessWidget {
  final BuildContext context;
  const MaybeCloseButton(this.context, {Key? key}) : super(key: key);

  @override
  Widget build(_) {
    final parentRoute = ModalRoute.of(context);
    final canPop = parentRoute?.canPop ?? false;
    return canPop
        ? CloseButton(onPressed: Navigator.of(context).pop)
        : const SizedBox();
  }
}
