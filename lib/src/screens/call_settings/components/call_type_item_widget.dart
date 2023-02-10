import 'package:flutter/material.dart';

class CallTypeItemWidget extends StatefulWidget {
  final ValueChanged<bool> onChange;
  final bool isAudio;

  const CallTypeItemWidget({
    Key? key,
    required this.onChange,
    this.isAudio = true,
  }) : super(key: key);

  @override
  State<CallTypeItemWidget> createState() => _CallTypeItemWidgetState();
}

class _CallTypeItemWidgetState extends State<CallTypeItemWidget> {
  var _isAudio = true;

  @override
  void initState() {
    _isAudio = widget.isAudio;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListTile(
        tileColor: Theme.of(context).cardColor,
        onTap: () {
          setState(() => _isAudio = !_isAudio);
          widget.onChange(_isAudio);
        },
        dense: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        title: const Text('Call Type'),
        leading: Icon(icon),
        trailing: Text(_isAudio ? 'Audio' : 'Video'),
      ),
    );
  }

  IconData get icon => _isAudio ? Icons.audiotrack : Icons.video_call;
}
