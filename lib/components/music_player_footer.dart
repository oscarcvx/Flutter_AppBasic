import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import '../services/audio_player_service.dart';

class MusicPlayerFooter extends StatefulWidget {
  @override
  _MusicPlayerFooterState createState() => _MusicPlayerFooterState();
}

class _MusicPlayerFooterState extends State<MusicPlayerFooter> {
  bool _isDragging = false;
  double _sliderValue = 0.0; // Valor inicial del slider
  Color _backgroundColor = Colors.blueAccent; // Color inicial de fondo

  @override
  void initState() {
    super.initState();
    _updateBackgroundColor();
  }

  Future<void> _updateBackgroundColor() async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage('assets/logos/rockr.png'),
    );
    setState(() {
      _backgroundColor = paletteGenerator.dominantColor?.color ?? Colors.blueAccent;
    });
  }

  void _onSliderChangeStart(double value) {
    setState(() {
      _isDragging = true;
    });
  }

  void _onSliderChanged(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  void _onSliderChangeEnd(double value) {
    final audioService = context.read<AudioPlayerService>();
    audioService.seek(Duration(seconds: value.toInt()));
    setState(() {
      _isDragging = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final audioService = context.watch<AudioPlayerService>();
    final currentPosition = _isDragging
        ? _sliderValue
        : audioService.audioPlayer.position.inSeconds.toDouble();
    final totalDuration = audioService.audioPlayer.duration?.inSeconds.toDouble() ?? 0.0;
    final sliderMax = totalDuration > 0 ? totalDuration : 1.0;

    // Para obtener el nombre del grupo y el nombre del tema, puedes usar una convención simple de nombres en la lista de reproducción.
    final trackName = audioService.currentTrackName; // Ajusta esto según tu método
    final groupName = "Nombre del Grupo"; // Ajusta esto según tu método

    return BottomAppBar(
      padding: EdgeInsets.all(0),
      height: 90,
      color: _backgroundColor,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        groupName,
                        style: TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        trackName,
                        style: TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.skip_previous, color: Colors.white, size: 40),
                  onPressed: () {
                    // Acción para retroceder canción
                    if (audioService.audioPlayer.processingState != ProcessingState.idle) {
                      audioService.playPreviousTrack();
                    }
                  },
                ),
                IconButton(
                  icon: Icon(
                    audioService.audioPlayer.playing ? Icons.pause : Icons.play_circle_outline,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    if (audioService.audioPlayer.playing) {
                      audioService.pause();
                    } else {
                      audioService.play(audioService.playlist[audioService.currentTrackIndex]); // Reproducción de audio local
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next, color: Colors.white, size: 40),
                  onPressed: () {
                    audioService.playNextTrack();
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
                  value: currentPosition.clamp(0.0, sliderMax),
                  min: 0,
                  max: sliderMax,
                  divisions: sliderMax.toInt() > 0 ? sliderMax.toInt() : 1,
                  onChangeStart: _onSliderChangeStart,
                  onChanged: _onSliderChanged,
                  onChangeEnd: _onSliderChangeEnd,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
