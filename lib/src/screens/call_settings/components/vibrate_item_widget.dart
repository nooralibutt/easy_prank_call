import 'package:flutter/material.dart';

class VibrateItemWidget extends StatefulWidget {
  final ValueChanged<bool> onChange;
  final bool isVibrating;

  const VibrateItemWidget({
    Key? key,
    required this.onChange,
    this.isVibrating = false,
  }) : super(key: key);

  @override
  State<VibrateItemWidget> createState() => _VibrateItemWidgetState();
}

class _VibrateItemWidgetState extends State<VibrateItemWidget> {
  var _isVibrating = true;

  @override
  void initState() {
    _isVibrating = widget.isVibrating;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListTile(
        tileColor: Theme.of(context).cardColor,
        onTap: () {
          setState(() => _isVibrating = !_isVibrating);
          widget.onChange(_isVibrating);
        },
        dense: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        title: const Text('Vibration'),
        leading: const Icon(Icons.vibration),
        trailing: Text(_isVibrating ? 'On' : 'Off'),
      ),
    );
  }
}
