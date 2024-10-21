import 'package:just_audio/just_audio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AudioPlayerService with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String get currentTrackName => _playlist.isNotEmpty ? _playlist[_currentTrackIndex] : '';


  List<String> _playlist = [
    'assets/audio/01. Squeeze Me Macaroni.mp3',
    'assets/audio/02. Slowly Growing Deaf.mp3',
    'assets/audio/03. Mr. Nice Guy.mp3',
  ];


  int _currentTrackIndex = 0;
  Duration _currentPosition = Duration.zero;
  AudioPlayer get audioPlayer => _audioPlayer;
  List<String> get playlist => _playlist;
  int get currentTrackIndex => _currentTrackIndex;

  AudioPlayerService() {
    _loadLastTrack();
    _audioPlayer.positionStream.listen((position) {
      _currentPosition = position;
      notifyListeners();
    });
    _audioPlayer.durationStream.listen((duration) {
      notifyListeners();
    });
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        _playNextTrack();
      }
    });
  }

  Future<void> _loadLastTrack() async {
    final prefs = await SharedPreferences.getInstance();
    _currentTrackIndex = prefs.getInt('currentTrackIndex') ?? 0;
    _currentPosition = Duration(seconds: prefs.getInt('currentPosition') ?? 0);
    _playlist = prefs.getStringList('playlist') ?? _playlist;
    if (_playlist.isNotEmpty && _currentTrackIndex < _playlist.length) {
      await _audioPlayer.setAsset(_playlist[_currentTrackIndex]);
      _audioPlayer.seek(_currentPosition);
      notifyListeners();
    }
  }

  Future<void> _saveCurrentTrack() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('currentTrackIndex', _currentTrackIndex);
    prefs.setInt('currentPosition', _currentPosition.inSeconds);
    prefs.setStringList('playlist', _playlist);
  }

  Future<void> play(String assetPath) async {
    if (_audioPlayer.processingState == ProcessingState.idle ||
        _audioPlayer.processingState == ProcessingState.completed) {
      await _audioPlayer.setAsset(assetPath);
    }
    _currentTrackIndex = _playlist.indexOf(assetPath);
    _audioPlayer.play();
    _saveCurrentTrack();
    notifyListeners();
  }

  Future<void> setPlaylist(List<String> playlist) async {
    _playlist = playlist;
    _currentTrackIndex = 0;
    await play(_playlist[_currentTrackIndex]);
  }

  void playNextTrack() async {
    _playNextTrack();
  }

  void _playNextTrack() async {
    if (_currentTrackIndex + 1 < _playlist.length) {
      _currentTrackIndex++;
      await _audioPlayer.setAsset(_playlist[_currentTrackIndex]);
      _audioPlayer.play();
      _saveCurrentTrack();
      notifyListeners();
    } else {
      _currentTrackIndex = 0; // Vuelve al inicio de la playlist
      await _audioPlayer.setAsset(_playlist[_currentTrackIndex]);
      _audioPlayer.play();
      _saveCurrentTrack();
      notifyListeners();
    }
  }

  void playPreviousTrack() async {
    if (_currentTrackIndex > 0) {
      _currentTrackIndex--;
      await _audioPlayer.setAsset(_playlist[_currentTrackIndex]);
      _audioPlayer.play();
      _saveCurrentTrack();
      notifyListeners();
    }
  }

  void pause() {
    _audioPlayer.pause();
    _saveCurrentTrack();
    notifyListeners();
  }

  void stop() {
    _audioPlayer.stop();
    notifyListeners();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
    _saveCurrentTrack();
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
