import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/head_app_bar.dart';
import '../components/music_player_footer.dart';
import '../components/nuevo_lanzamiento.dart';
import '../components/album_grid.dart';
import '../route_gen/routes_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> albums = [
    {'title': 'Despertar', 'band': 'TronN', 'imagePath': 'assets/logos/rockr.png'},
    {'title': 'Rock de Raíz', 'band': 'TronN', 'imagePath': 'assets/logos/rockr.png'},
    // Agrega más álbumes aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MusicPlayerFooter(),
      extendBodyBehindAppBar: true,
      appBar: HeadAppBar(),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Icon(Icons.home, color: Color.fromARGB(255, 212, 214, 213)),
                    SizedBox(width: 8),
                    Text('Nuevos lanzamientos', style: TextStyle(color: Color.fromARGB(255, 212, 214, 213))),
                  ],
                ),
              ),
              NuevoLanzamiento(
                title: 'Nada - Infinito',
                subtitle: 'Noviembre 2024',
                imagePath: 'assets/logos/rockr.png',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Text('Tu colección', style: TextStyle(color: Color.fromARGB(255, 212, 214, 213))),
                  ],
                ),
              ),
              AlbumGrid(albums: albums, onAlbumTap: (album) {
                context.go(RoutesPaths.album_detail, extra: album);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
