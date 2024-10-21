import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LoadImage extends StatelessWidget {
  final String imagePath;

  const LoadImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  bool _isLocalPath(String path) {
    return path.contains('assets/') || path.contains('images/');
  }

  @override
  Widget build(BuildContext context) {
    if (_isLocalPath(imagePath)) {
      return Image.asset(imagePath, fit: BoxFit.cover); // Asegúrate de que las imágenes locales se ajusten correctamente
    } else {
      return CachedNetworkImage(
        imageUrl: imagePath,
        fit: BoxFit.cover, // Asegúrate de que las imágenes remotas se ajusten correctamente
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    }
  }
}
