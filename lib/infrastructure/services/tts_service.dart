import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';

class TTSService {
  static late final FlutterTts _tts;
  static late final AudioPlayer _audio;

  const TTSService._();

  static Future<void> initialize() async {
    _tts = FlutterTts();
    _audio = AudioPlayer();
    await _audio.setAsset("assets/sounds/signal.mp3");
    await _tts.awaitSpeakCompletion(true);
    await _tts.setVolume(1);
    await _tts.setSpeechRate(0.6);
    await _tts.setLanguage("ru");
  }

  static Future<void> speakMeter(int meter) async =>
      _tts.speak("До радара осталось $meter метров");

  static void speakOtherRadar() => _tts
    ..stop()
    ..speak("Рядом обнаружен еще один радар");

  static Future<void> speakWhenOutside() async {
    await stop();
    _tts
      ..stop()
      ..speak("Опасность миновала. Маршрут безопасен");
  }

  static void beepSound() => _audio.play();

  static Future<void> stop() async => _audio.stop();
}
