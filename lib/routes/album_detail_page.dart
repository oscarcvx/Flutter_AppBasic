import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import '../components/load_image.dart';
import '../services/audio_player_service.dart';
import '../components/music_player_footer.dart';

class AlbumDetailPage extends StatefulWidget {
  final Map<String, String> album;

  const AlbumDetailPage({Key? key, required this.album}) : super(key: key);

  @override
  _AlbumDetailPageState createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  Color? dominantColor;
  String? selectedTrackNumber;

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  Future<void> _updatePalette() async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage(widget.album['imagePath'] ?? 'assets/logos/rockr.png'),
    );
    setState(() {
      dominantColor = paletteGenerator.dominantColor?.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    final album = widget.album;
    final tracklist = [
      {'number': '1', 'title': 'Canción del minero', 'duration': '4:29', 'path': 'assets/audio/01. Squeeze Me Macaroni.mp3'},
      {'number': '2', 'title': 'Herminada de la Victoria', 'duration': '4:22', 'path': 'assets/audio/02. Slowly Growing Deaf.mp3'},
      {'number': '3', 'title': 'Por que los pobres', 'duration': '4:49', 'path': 'assets/audio/03. Mr. Nice Guy.mp3'},
      {'number': '4', 'title': 'Preguntas por Puerto Montt', 'duration': '4:02', 'path': 'assets/audio/01. Squeeze Me Macaroni.mp3'},
      {'number': '5', 'title': 'Corazón maldito', 'duration': '4:12', 'path': 'assets/audio/02. Slowly Growing Deaf.mp3'},
      {'number': '6', 'title': 'A desalambrar', 'duration': '1:45', 'path': 'assets/audio/03. Mr. Nice Guy.mp3'},
      {'number': '7', 'title': 'Miren como sonrien', 'duration': '4:22', 'path': 'assets/audio/01. Squeeze Me Macaroni.mp3'},
      {'number': '8', 'title': 'El pueblo', 'duration': '5:17', 'path': 'assets/audio/02. Slowly Growing Deaf.mp3'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(album['title'] ?? 'Album'),
        backgroundColor: dominantColor ?? Theme.of(context).primaryColor,
      ),
      bottomNavigationBar: MusicPlayerFooter(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              dominantColor ?? Color.fromARGB(255, 54, 60, 66),
              Color.fromARGB(255, 33, 36, 41),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    LoadImage(imagePath: album['imagePath'] ?? 'assets/logos/rockr.png'),
                    SizedBox(height: 16),
                    Text(
                      album['title'] ?? '',
                      style: TextStyle(
                        color: Color.fromARGB(255, 212, 214, 213),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      album['band'] ?? '',
                      style: TextStyle(
                        color: Color.fromARGB(255, 212, 214, 213),
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.share, color: Color.fromARGB(255, 212, 214, 213)),
                        Icon(Icons.download, color: Color.fromARGB(255, 212, 214, 213)),
                        Icon(Icons.playlist_add, color: Color.fromARGB(255, 212, 214, 213)),
                        Icon(Icons.play_arrow, color: Color.fromARGB(255, 212, 214, 213)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Tracklist',
                style: TextStyle(
                  color: Color.fromARGB(255, 212, 214, 213),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: tracklist.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTrackNumber = tracklist[index]['number'];
                        });
                        context.read<AudioPlayerService>().play(tracklist[index]['path']!);
                      },
                      child: Container(
                        color: selectedTrackNumber == tracklist[index]['number']
                            ? Colors.green
                            : Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                tracklist[index]['number'] ?? '',
                                style: TextStyle(
                                  color: tracklist[index]['number'] == '4'
                                      ? Colors.green
                                      : Color.fromARGB(255, 212, 214, 213),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                tracklist[index]['title'] ?? '',
                                style: TextStyle(
                                  color: tracklist[index]['number'] == '4'
                                      ? Colors.green
                                      : Color.fromARGB(255, 212, 214, 213),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                tracklist[index]['duration'] ?? '',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 212, 214, 213),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
