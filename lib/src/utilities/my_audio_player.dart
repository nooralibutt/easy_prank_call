import 'package:just_audio/just_audio.dart';

class MyAudioPlayer {
  // Singleton instance code
  static final MyAudioPlayer _instance = MyAudioPlayer._();
  static MyAudioPlayer get instance => _instance;
  MyAudioPlayer._();

  final _alertPlayer = AudioPlayer();

  Future<void> init() async {
    await _alertPlayer
        .setAudioSource(AudioSource.asset("assets/sounds/alert.mp3"));
  }

  void stopRingtone() => _alertPlayer.stop();

  void playRingtone() {
    _alertPlayer.setLoopMode(LoopMode.all);
    _alertPlayer.load();
  }
}
