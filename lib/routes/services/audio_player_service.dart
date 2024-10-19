import 'package:just_audio/just_audio.dart';
import 'package:flutter/foundation.dart';

class AudioPlayerService with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayer get audioPlayer => _audioPlayer;

  AudioPlayerService() {
    _audioPlayer.positionStream.listen((position) {
      notifyListeners();
    });

    _audioPlayer.durationStream.listen((duration) {
      notifyListeners();
    });
  }

  Future<void> play(String assetPath) async {
    if (_audioPlayer.processingState == ProcessingState.idle) {
      await _audioPlayer.setAsset(assetPath);
    }
    _audioPlayer.play();
    notifyListeners();
  }

  void pause() {
    _audioPlayer.pause();
    notifyListeners();
  }

  void stop() {
    _audioPlayer.stop();
    notifyListeners();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
/*
class AudioPlayerService with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayer get audioPlayer => _audioPlayer;

  AudioPlayerService() {
    _audioPlayer.positionStream.listen((position) {
      notifyListeners();
    });

    _audioPlayer.durationStream.listen((duration) {
      notifyListeners();
    });
  }

  Future<void> play(String assetPath) async {
    if (_audioPlayer.processingState == ProcessingState.idle) {
      await _audioPlayer.setAsset(assetPath);
    }
    _audioPlayer.play();
    notifyListeners();
  }

  void pause() {
    _audioPlayer.pause();
    notifyListeners();
  }

  void stop() {
    _audioPlayer.stop();
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}

class AudioPlayerService with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayer get audioPlayer => _audioPlayer;

  AudioPlayerService() {
    _audioPlayer.positionStream.listen((position) {
      notifyListeners();
    });

    _audioPlayer.durationStream.listen((duration) {
      notifyListeners();
    });
  }

  Future<void> playLocal(String assetPath) async {
    await _audioPlayer.setAsset(assetPath);
    _audioPlayer.play();
    notifyListeners();
  }


  Future<void> play(String assetPath) async {
    if (_audioPlayer.playing) {
      _audioPlayer.play();
    } else {
      await _audioPlayer.setAsset(assetPath);
      _audioPlayer.play();
    }
    notifyListeners();
  }

  void pause() {
    _audioPlayer.pause();
    notifyListeners();
  }

  void stop() {
    _audioPlayer.stop();
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
*/