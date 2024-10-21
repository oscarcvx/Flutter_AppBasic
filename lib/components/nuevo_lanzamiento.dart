import 'package:flutter/material.dart';
import 'load_image.dart';

class NuevoLanzamiento extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const NuevoLanzamiento({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 54, 60, 66), // Color del fondo
          borderRadius: BorderRadius.circular(10), // Bordes redondeados
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              LoadImage(imagePath: imagePath),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color.fromARGB(255, 212, 214, 213), // Color de la fuente
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Color.fromARGB(255, 212, 214, 213), // Color de la fuente
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
