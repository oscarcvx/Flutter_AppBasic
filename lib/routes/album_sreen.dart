import 'package:flutter/material.dart';

class AlbumScreen extends StatelessWidget {
  final List<Map<String, String>> tracks = [
    {"title": "Canción del minero", "duration": "4:29"},
    {"title": "Herminada de la Victoria", "duration": "4:22"},
    {"title": "Por que los pobres", "duration": "4:49"},
    {"title": "Preguntas por Puerto Montt", "duration": "4:02"},
    {"title": "Corazón maldito", "duration": "4:12"},
    {"title": "A desalambrar", "duration": "1:45"},
    {"title": "Miren como sonrien", "duration": "4:22"},
    {"title": "El pueblo", "duration": "5:17"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rock de Raíz'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/logos/rockr.png', // Imagen del álbum
                  height: 200,
                ),
                SizedBox(height: 8),
                Text(
                  'Rock de Raíz',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Tronn',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {
                        // Acción para compartir
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.file_download),
                      onPressed: () {
                        // Acción para descargar
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.playlist_add),
                      onPressed: () {
                        // Acción para agregar a playlist
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.play_arrow),
                      onPressed: () {
                        // Acción para reproducir
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tracks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text('${index + 1}'),
                  title: Text(tracks[index]["title"]!),
                  trailing: Text(tracks[index]["duration"]!),
                  onTap: () {
                    // Acción al hacer clic en una canción
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
