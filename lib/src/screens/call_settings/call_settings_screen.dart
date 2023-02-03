import 'package:easy_prank_call/easy_prank_call.dart';
import 'package:easy_prank_call/src/easy_prank_call_controller.dart';
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
  State<CallSettingsScreen> createState() => _CallSettingsScreenState();
}

class _CallSettingsScreenState extends State<CallSettingsScreen> {
  var _durationSelected = const Duration(seconds: 0);
  var _typeSelected = CallType.audio;
  var _isVibrating = true;

  @override
  Widget build(BuildContext context) {
    final controller = EasyPrankCallController.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Call Settings',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
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
            if (controller.placementBuilder != null)
              controller.placementBuilder!
                  .call(context, PrankCallPlacement.callSettingsBottom),
          ],
        ),
      ),
    );
  }

  Future<void> _pressedCall() async {
    bool canSetOrDownload = true;
    if (_durationSelected != const Duration(seconds: 0)) {
      final controller = EasyPrankCallController.of(context);

      if (controller.onDialCall != null) {
        canSetOrDownload = await controller.onDialCall!.call(context);
      }
      // NotificationManager.instance
      //     .scheduleNotificationOnScheduleCall(_durationSelected);
    }
    if (canSetOrDownload) _moveToCallScreen();
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
