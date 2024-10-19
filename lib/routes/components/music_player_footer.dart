import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/audio_player_service.dart';

class MusicPlayerFooter extends StatefulWidget {
  @override
  _MusicPlayerFooterState createState() => _MusicPlayerFooterState();
}

class _MusicPlayerFooterState extends State<MusicPlayerFooter> {
  void _onSliderChanged(double value) {
    context.read<AudioPlayerService>().audioPlayer.seek(Duration(seconds: value.toInt()));
  }

  @override
  Widget build(BuildContext context) {
    final audioService = context.watch<AudioPlayerService>();
    final currentPosition = audioService.audioPlayer.position.inSeconds.toDouble();
    final totalDuration = audioService.audioPlayer.duration?.inSeconds.toDouble() ?? 1.0;

    return BottomAppBar(
      padding: EdgeInsets.all(0),
      height: 90,
      color: Colors.blueAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  'assets/logos/rockr.png', // Ruta de la imagen de la carátula del álbum
                  width: 60,
                  height: 60,
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    "ASÑLDKASÑLKD AUI QOWIEUOQW",
                    style: TextStyle(color: Colors.white),
                    maxLines: 2,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.skip_previous, color: Colors.white, size: 40),
                  onPressed: () {
                    // Acción para retroceder canción
                  },
                ),
                IconButton(
                  icon: Icon(audioService.audioPlayer.playing ? Icons.pause : Icons.play_circle_outline, color: Colors.white, size: 40),
                  onPressed: () {
                    if (audioService.audioPlayer.playing) {
                      audioService.pause();
                    } else {
                      audioService.play('assets/audio/5-MB-MP3.mp3'); // Reproducción de audio local
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next, color: Colors.white, size: 40),
                  onPressed: () {
                    // Acción para avanzar canción
                  },
                ),
                SizedBox(width: 20), // Espacio adicional
              ],
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.0), // Tamaño del thumb
                  trackHeight: 2.0, // Altura del track
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 7.0), // Tamaño del overlay
                  valueIndicatorTextStyle: TextStyle(color: Colors.white),
                  overlayColor: Colors.blue.withAlpha(32),
                  thumbColor: Colors.white,
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.white54,
                  trackShape: RectangularSliderTrackShape(),
                ),
                child: Slider(
                  value: currentPosition,
                  min: 0,
                  max: totalDuration,
                  divisions: totalDuration.toInt(),
                  onChanged: _onSliderChanged,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}