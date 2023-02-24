# Easy Prank Call

[![pub package](https://img.shields.io/pub/v/easy_prank_call.svg?logo=dart&logoColor=00b9fc)](https://pub.dartlang.org/packages/easy_prank_call)
[![Last Commits](https://img.shields.io/github/last-commit/nooralibutt/easy_prank_call?logo=git&logoColor=white)](https://github.com/nooralibutt/easy_prank_call/commits/master)
[![Pull Requests](https://img.shields.io/github/issues-pr/nooralibutt/easy_prank_call?logo=github&logoColor=white)](https://github.com/nooralibutt/easy_prank_call/pulls)
[![Code size](https://img.shields.io/github/languages/code-size/nooralibutt/easy_prank_call?logo=github&logoColor=white)](https://github.com/nooralibutt/easy_prank_call)
[![License](https://img.shields.io/github/license/nooralibutt/easy_prank_call?logo=open-source-initiative&logoColor=green)](https://github.com/nooralibutt/easy_prank_call/blob/master/LICENSE)

**Show some 💙, 👍 the package & ⭐️ the repo to support the project**

You can schedule a prank audio and video call with this package.

## Features
- Support Incoming Audio call
- Support incoming video call
- Support for Schedule Call for Future

![](https://github.com/nooralibutt/easy_prank_call/blob/master/demo_gif.gif?raw=true)

## How to use

```dart
EasyPrankCallApp(
  title: 'Scary Teacher Prank',
  avatarImgPath: 'assets/images/calling_face.jpg',
  videoPath: 'assets/videos/teacher_video.mov',
  placementBuilder: _addPlacements,
  onTapEvent: _onTapEvent,
  onDialCall: _callOnWatchAd,
  callType: EasyCallType.video,
  callScheduleDuration: Duration(seconds: 7),
  skipCallSettings: true,
  ringtonePath: 'YOUR_AUDIO_URL / YOUR_AUDIO_ASSET',
)
```

### iOS Permissions

You have to add following permissions to access your camera.
```
	<key>NSCameraUsageDescription</key>
    <string>In order to video call, we need this permission.</string>
    <key>NSMicrophoneUsageDescription</key>
    <string>In order to video call, we need this permission.</string>
```


See [Example](https://pub.dev/packages/easy_prank_call/example) for better understanding.

## Authors
##### Noor Ali Butt
[![GitHub Follow](https://img.shields.io/badge/Connect--blue.svg?logo=Github&longCache=true&style=social&label=Follow)](https://github.com/nooralibutt) [![LinkedIn Link](https://img.shields.io/badge/Connect--blue.svg?logo=linkedin&longCache=true&style=social&label=Connect
)](https://www.linkedin.com/in/nooralibutt)
##### Hanzla Waheed
[![GitHub Follow](https://img.shields.io/badge/Connect--blue.svg?logo=Github&longCache=true&style=social&label=Follow)](https://github.com/mhanzla80) [![LinkedIn Link](https://img.shields.io/badge/Connect--blue.svg?logo=linkedin&longCache=true&style=social&label=Connect
)](https://www.linkedin.com/in/mhanzla80)