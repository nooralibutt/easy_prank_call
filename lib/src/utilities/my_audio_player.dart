import 'package:audioplayers/audioplayers.dart';

class MyAudioPlayer {
  // Singleton instance code
  static final MyAudioPlayer _instance = MyAudioPlayer._();
  static MyAudioPlayer get instance => _instance;
  MyAudioPlayer._();

  final AudioCache _audioCache = AudioCache(prefix: 'assets/audio/');
  AudioPlayer? _audioPlayer;

  Future<void> init() => _audioCache.loadAll([
        'ios_call_opening.mp3',
        'applause.mp3',
        'receive.mp3',
        'sent.mp3',
        'level fail sound.mp3',
        'button tap.mp3',
        'tap failed.mp3',
        'success.wav',
        'scratching.mp3',
      ]);

  Future<AudioPlayer> playRingtone() => _audioCache
      .loop('ios_call_opening.mp3')
      .then((player) => _audioPlayer = player);

  void stopRingtone() {
    _audioPlayer?.stop();
    _audioPlayer = null;
  }
}
