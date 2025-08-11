import 'dart:async';

import 'package:easy_ads_flutter/easy_ads_flutter.dart';
import 'package:easy_prank_call/easy_prank_call.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyAds.instance.initialize(
    const TestAdIdManager(),
    fbiOSAdvertiserTrackingEnabled: true,
    fbTestMode: true,
    unityTestMode: true,
    isAgeRestrictedUserForApplovin: false,
    admobConfiguration: RequestConfiguration(
        testDeviceIds: [], maxAdContentRating: MaxAdContentRating.pg),
    adMobAdRequest:
        const AdRequest(nonPersonalizedAds: false, keywords: <String>[]),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getMainWidget('assets/videos/teacher_video.mov'),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressedStandalone,
        tooltip: 'Launch standalone',
        child: const Icon(Icons.launch),
      ),
    );
  }

  void onPressedStandalone() {
    const path =
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
    Navigator.of(context).push(
      MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => Scaffold(body: getMainWidget(path))),
    );
  }

  Widget getMainWidget(String videoPath) {
    return EasyPrankCallApp(
      title: 'Teacher Prank',
      avatarImgPath: 'assets/images/calling_face.jpg',
      videoPath: videoPath,
      placementBuilder: _addPlacements,
      onTapEvent: _onTapEvent,
      callType: EasyCallType.video,
      callScheduleDuration: Duration(seconds: 7),
      skipCallSettings: true,
      ringtonePath: 'assets/audio/ios_call_opening.mp3',
    );
  }

  Widget _addPlacements(BuildContext context, PrankCallPlacement placement) {
    switch (placement) {
      case PrankCallPlacement.callSettingsBottom:
        return Container(height: 50, width: double.infinity, color: Colors.red);
    }
  }

  void _onTapEvent(BuildContext context, PrankCallEventAction eventAction) {
    printLog(eventAction.name);
  }

  void printLog(String str) {
    if (kDebugMode) {
      print(str);
    }
  }
}
