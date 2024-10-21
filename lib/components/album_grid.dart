import 'package:flutter/material.dart';
import 'load_image.dart';

class AlbumGrid extends StatelessWidget {
  final List<Map<String, String>> albums;
  final Function(Map<String, String>) onAlbumTap; // Añadir callback para manejar el evento de clic

  const AlbumGrid({
    Key? key,
    required this.albums,
    required this.onAlbumTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var crossAxisCount = 2;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 1/1.2,
        ),
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];
          return GestureDetector(
            onTap: () => onAlbumTap(album), // Usar el callback cuando se hace clic en un álbum
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: LoadImage(imagePath: album['imagePath'] ?? 'assets/logos/rockr.png'),
                ),
                SizedBox(height: 4),
                Text(
                  album['title'] ?? '',
                  style: TextStyle(color: Color.fromARGB(255, 212, 214, 213)),
                ),
                Text(
                  album['band'] ?? '',
                  style: TextStyle(color: Color.fromARGB(255, 212, 214, 213)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
