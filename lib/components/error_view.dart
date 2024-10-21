import 'package:basic_app/route_gen/routes_config.dart';
import 'package:basic_app/routes/home_page.dart';
import 'package:basic_app/route_gen/go_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'music_player_footer.dart';

class ErrorView extends StatelessWidget {
  final String mensaje;

  const ErrorView({
    super.key,
    required this.mensaje
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MusicPlayerFooter(),
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
                //GoRoute(context).back();
                context.pop();
              },
            ),

            IconButton(
              icon: Icon(Icons.message_outlined,size: 50,color: Colors.amberAccent),
              iconSize: 58.0,
              onPressed: () {
                //GoRoute(context).backTo(const HomePage(title: "Vuelta"));
                //GoRoute(context).backToNamed(RoutesConfig.home);
                context.replace(RoutesPaths.home);
              },
            ),


          ],
        ),
      ),
    );
  }
}
