import 'package:flutter/material.dart';

enum CallType { audio, video }

class CallTypeItemWidget extends StatefulWidget {
  final ValueChanged<CallType> onChange;

  const CallTypeItemWidget({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  _CallTypeItemWidgetState createState() => _CallTypeItemWidgetState();
}

class _CallTypeItemWidgetState extends State<CallTypeItemWidget> {
  var _typeSelected = CallType.audio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListTile(
        tileColor: Theme.of(context).cardColor,
        onTap: () => _showTimerBottomSheet(context),
        dense: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        title: const Text('Call Type'),
        leading: Icon(_getIcon(_typeSelected)),
        trailing: Text(_getTextStr(_typeSelected)),
      ),
    );
  }

  static String _getTextStr(CallType type) =>
      type == CallType.audio ? 'Audio' : 'Video';

  static IconData _getIcon(CallType type) =>
      type == CallType.audio ? Icons.call : Icons.video_call;

  void _showTimerBottomSheet(context) async {
    final selectedItem = await showModalBottomSheet<CallType>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            top: false,
            child: Wrap(
                children: CallType.values.map((item) {
              return ListTile(
                leading: Icon(_getIcon(item)),
                title: Text(_getTextStr(item)),
                onTap: () => Navigator.pop(context, item),
              );
            }).toList()),
          );
        });

    if (selectedItem == null) return;

    setState(() => _typeSelected = selectedItem);

    widget.onChange(selectedItem);
  }
}