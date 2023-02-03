import 'dart:async';

import 'package:easy_prank_call/src/screens/call_settings/components/timer_setting_item_widget.dart';
import 'package:flutter/material.dart';

class CallSchedulerBlackScreen extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const CallSchedulerBlackScreen({
    Key? key,
    required this.child,
    required this.duration,
  }) : super(key: key);

  @override
  State<CallSchedulerBlackScreen> createState() =>
      _CallSchedulerBlackScreenState();
}

class _CallSchedulerBlackScreenState extends State<CallSchedulerBlackScreen> {
  bool _isShowingCall = false;
  bool _isFakeCallPromptVisible = true;

  @override
  void initState() {
    super.initState();

    if (widget.duration.inSeconds == 0) {
      _isShowingCall = true;
    } else {
      Future.delayed(
          const Duration(seconds: 3),
          () => setState(
              () => _isFakeCallPromptVisible = !_isFakeCallPromptVisible));
      Timer(widget.duration, () => setState(() => _isShowingCall = true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isShowingCall ? widget.child : _getBlackScreenWidget();
  }

  Widget _getBlackScreenWidget() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(child: Container(color: Colors.black)),
        Positioned(
          left: 20,
          right: 20,
          bottom: 20,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: _isFakeCallPromptVisible ? 1 : 0,
            child: Text(
              'You will get a fake call ${widget.duration.toTimeLater()}, don\'t lock screen or return to home screen.',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        )
      ],
    );
  }
}
