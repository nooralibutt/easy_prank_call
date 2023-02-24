import 'package:easy_prank_call/easy_prank_call.dart';
import 'package:easy_prank_call/src/easy_prank_call_controller.dart';
import 'package:easy_prank_call/src/screens/call_settings/components/call_type_item_widget.dart';
import 'package:easy_prank_call/src/screens/call_settings/components/timer_setting_item_widget.dart';
import 'package:easy_prank_call/src/screens/call_settings/components/vibrate_item_widget.dart';
import 'package:easy_prank_call/src/widgets/maybe_close_button.dart';
import 'package:flutter/material.dart';

class CallSettingsScreen extends StatefulWidget {
  static const String routeName = "/callSettings";
  final EasyPrankCallController controller;
  const CallSettingsScreen(this.controller, {super.key});

  @override
  State<CallSettingsScreen> createState() => _CallSettingsScreenState();
}

class _CallSettingsScreenState extends State<CallSettingsScreen> {
  var _durationSelected = const Duration(seconds: 0);
  var _isAudio = true;
  var _isVibrating = true;

  @override
  void initState() {
    super.initState();
    _isAudio = widget.controller.callSetting.callType == EasyCallType.audio;
    _isVibrating = widget.controller.callSetting.isVibrationOn;
    _durationSelected = widget.controller.callSetting.callScheduleDuration;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  MaybeCloseButton(widget.controller.parentContext),
                  Text(
                    'Call Settings',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TimerSettingItemWidget(
                  onChange: (duration) => _durationSelected = duration),
              CallTypeItemWidget(
                onChange: (isAudio) => _isAudio = isAudio,
                isAudio: _isAudio,
              ),
              VibrateItemWidget(
                  isVibrating: _isVibrating,
                  onChange: (isVibrating) => _isVibrating = isVibrating),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: _pressedCall,
                  icon: const Icon(Icons.call),
                  label: const Text('Prank Call'),
                ),
              ),
              if (widget.controller.placementBuilder != null)
                widget.controller.placementBuilder!
                    .call(context, PrankCallPlacement.callSettingsBottom),
            ],
          ),
        ),
      ),
    );
  }

  void _pressedCall() {
    // if (_durationSelected != const Duration(seconds: 0)) {
    // NotificationManager.instance
    //     .scheduleNotificationOnScheduleCall(_durationSelected);
    // }

    widget.controller.callSetting.callType =
        _isAudio ? EasyCallType.audio : EasyCallType.video;
    widget.controller.callSetting.isVibrationOn = _isVibrating;
    widget.controller.callSetting.callScheduleDuration = _durationSelected;
    final screen = widget.controller.getCallScreen();
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => screen, fullscreenDialog: true));
  }
}
