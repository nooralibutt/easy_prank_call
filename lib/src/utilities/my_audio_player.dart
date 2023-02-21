import 'package:just_audio/just_audio.dart';

class MyAudioPlayer {
  // Singleton instance code
  static final MyAudioPlayer _instance = MyAudioPlayer._();
  static MyAudioPlayer get instance => _instance;
  MyAudioPlayer._();

  final _ringtonePlayer = AudioPlayer();

  Future<void> init(String ringtonePath) async {
    await _ringtonePlayer.setAudioSource(AudioSource.asset(ringtonePath));
  }

  void stopRingtone() => _ringtonePlayer.stop();

  void playRingtone() {
    _ringtonePlayer.setLoopMode(LoopMode.all);
    _ringtonePlayer.load();
  }
}
