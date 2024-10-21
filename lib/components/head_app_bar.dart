import 'package:flutter/material.dart';

class HeadAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(80); // Define la altura del AppBar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 80, // Altura del toolbar para agrandar los íconos
      backgroundColor: Color.fromARGB(40, 0, 0, 0),
      shadowColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      elevation: 0,
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, size: 40, color: Color.fromARGB(255, 212, 214, 213)),
              tooltip: 'Home',
              onPressed: () {
                // Acción para Home
              },
            ),
            SizedBox(width: 10), // Espacio entre los íconos
            IconButton(
              icon: Icon(Icons.search, size: 40, color: Color.fromARGB(255, 212, 214, 213)),
              tooltip: 'Buscar',
              onPressed: () {
                // Acción para Buscar
              },
            ),
            SizedBox(width: 10), // Espacio entre los íconos
            IconButton(
              icon: Icon(Icons.settings, size: 40, color: Color.fromARGB(255, 212, 214, 213)),
              tooltip: 'Config.',
              onPressed: () {
                // Acción para Configuración
              },
            ),
            SizedBox(width: 30),
          ],
        ),
      ),
    );
  }
}