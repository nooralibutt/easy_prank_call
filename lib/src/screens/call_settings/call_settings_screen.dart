import 'package:easy_prank_call/src/models/call_settings_model.dart';
import 'package:easy_prank_call/src/screens/audio_call/audio_call_screen.dart';
import 'package:easy_prank_call/src/screens/call_settings/components/call_type_item_widget.dart';
import 'package:easy_prank_call/src/screens/call_settings/components/timer_setting_item_widget.dart';
import 'package:easy_prank_call/src/screens/call_settings/components/vibrate_item_widget.dart';
import 'package:easy_prank_call/src/screens/video_call/video_call_screen.dart';
import 'package:flutter/material.dart';

class CallSettingsScreen extends StatefulWidget {
  static const String routeName = "/callSettings";

  const CallSettingsScreen({super.key});

  @override
  _CallSettingsScreenState createState() => _CallSettingsScreenState();
}

class _CallSettingsScreenState extends State<CallSettingsScreen> {
  var _durationSelected = const Duration(seconds: 0);
  var _typeSelected = CallType.audio;
  var _isVibrating = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Call Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TimerSettingItemWidget(
                onChange: (duration) => _durationSelected = duration),
            CallTypeItemWidget(onChange: (type) => _typeSelected = type),
            VibrateItemWidget(
                isVibrating: _isVibrating,
                onChange: (isVibrating) => _isVibrating = isVibrating),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton.icon(
                onPressed: _pressedCall,
                icon: const Icon(Icons.call),
                label: const Text('Schedule Prank Call'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _pressedCall() {
    if (_durationSelected != const Duration(seconds: 0)) {
      // NotificationManager.instance
      //     .scheduleNotificationOnScheduleCall(_durationSelected);
    }
    _moveToCallScreen();
  }

  void _moveToCallScreen() async {
    await Navigator.pushNamed(
        context,
        _typeSelected == CallType.audio
            ? AudioCallScreen.routeName
            : VideoCallScreen.routeName,
        arguments: CallSettingsModel(_durationSelected, _isVibrating));
  }
}
