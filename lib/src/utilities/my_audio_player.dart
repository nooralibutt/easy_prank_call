import 'package:just_audio/just_audio.dart';

class MyAudioPlayer {
  // Singleton instance code
  static final MyAudioPlayer _instance = MyAudioPlayer._();
  static MyAudioPlayer get instance => _instance;
  MyAudioPlayer._();

  AudioPlayer? _ringtonePlayer;

  Future<void> init(String? ringtonePath) {
    if (ringtonePath == null || _ringtonePlayer != null) return Future.value();

    _ringtonePlayer = AudioPlayer();
    if (ringtonePath.startsWith('http')) {
      return _ringtonePlayer!
          .setAudioSource(AudioSource.uri(Uri.parse(ringtonePath)));
    } else {
      return _ringtonePlayer!.setAudioSource(AudioSource.asset(ringtonePath));
    }
  }

  void stopRingtone() {
    _ringtonePlayer?.stop();
    _ringtonePlayer?.load();
  }

  void playRingtone() {
    _ringtonePlayer?.setLoopMode(LoopMode.all);
    _ringtonePlayer?.play();
  }
}
