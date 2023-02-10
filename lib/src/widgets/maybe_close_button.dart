import 'package:flutter/material.dart';

class MaybeCloseButton extends StatelessWidget {
  final BuildContext context;
  const MaybeCloseButton(this.context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parentRoute = ModalRoute.of(this.context);
    final canPop = parentRoute?.canPop ?? false;
    return canPop
        ? CloseButton(onPressed: Navigator.of(this.context).pop)
        : const SizedBox();
  }
}
