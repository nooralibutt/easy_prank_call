import 'package:flutter/material.dart';

class TimerSettingItemWidget extends StatefulWidget {
  final ValueChanged<Duration> onChange;

  const TimerSettingItemWidget({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  State<TimerSettingItemWidget> createState() => _TimerSettingItemWidgetState();
}

class _TimerSettingItemWidgetState extends State<TimerSettingItemWidget> {
  var _timeSelected = const Duration(seconds: 0);

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
        title: const Text('Timer'),
        leading: const Icon(Icons.timer),
        trailing: Text(_timeSelected.toTimeLater()),
      ),
    );
  }

  void _showTimerBottomSheet(BuildContext context) async {
    final selectedItem = await showModalBottomSheet<Duration>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          final list = [
            const Duration(seconds: 0),
            const Duration(seconds: 5),
            const Duration(seconds: 10),
            const Duration(seconds: 30),
            const Duration(minutes: 1),
            const Duration(minutes: 3),
            const Duration(minutes: 5),
            const Duration(minutes: 10),
            const Duration(minutes: 30),
            const Duration(hours: 1),
          ];

          return SafeArea(
            top: false,
            child: Wrap(
                children: list.map((item) {
              return ListTile(
                dense: true,
                leading: const Icon(Icons.timer),
                title: Text(item.toTimeLater()),
                onTap: () => Navigator.pop(context, item),
              );
            }).toList()),
          );
        });

    if (selectedItem == null) return;

    setState(() => _timeSelected = selectedItem);

    widget.onChange(selectedItem);
  }
}

extension DurationExtension on Duration {
  String toTimeLater() {
    if (inSeconds == 0) {
      return 'Immediately';
    } else if (inSeconds < 60) {
      return '$inSeconds seconds later';
    } else if (inMinutes == 1) {
      return '$inMinutes minute later';
    } else if (inMinutes < 60) {
      return '$inMinutes minutes later';
    } else if (inHours == 1) {
      return '$inHours hour later';
    } else {
      return '$inHours hours later';
    }
  }
}
