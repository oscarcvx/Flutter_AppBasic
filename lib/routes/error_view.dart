import 'package:basic_app/routes/home_page.dart';
import 'package:basic_app/route_gen/go_route.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String mensaje;

  const ErrorView({
    super.key,
    required this.mensaje
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ha ocurrido un problema'),

            Text('"$mensaje"'),

            IconButton(
              icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
              iconSize: 58.0,
              onPressed: () {
                GoRoute(context).back();
              },
            ),

            IconButton(
              icon: Icon(Icons.message_outlined,size: 50,color: Colors.amberAccent),
              iconSize: 58.0,
              onPressed: () {
                GoRoute(context).backTo(const HomePage(title: "Vuelta"));
              },
            ),


          ],
        ),
      ),
    );
  }
}
