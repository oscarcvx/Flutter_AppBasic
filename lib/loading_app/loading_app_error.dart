import 'package:flutter/material.dart';

class LoadingAppError extends StatelessWidget{
  const LoadingAppError({super.key,required this.mensaje});

  final String mensaje;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: $mensaje'),
            ),

          ]
        ),
      ),
    );
  }
}



