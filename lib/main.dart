import 'package:basic_app/route_gen/routes_config.dart';
import 'package:basic_app/routes/album_detail_page.dart';
import 'package:basic_app/routes/album_sreen.dart';
import 'package:basic_app/routes/home_page.dart';
import 'package:basic_app/routes/login_pass.dart';
import 'package:basic_app/services/audio_player_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'loading_app/loading_app.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioPlayerService()),
      ],
      child: MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //key: navigatorKey,
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        scaffoldBackgroundColor: Color.fromARGB(255,33, 36, 41),
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: GoogleFonts.roboto().debugLabel,
        useMaterial3: true,
      )
     /* home: Center(
          child: Container(
            //width: MediaQuery.of(context).size.width * 0.5,
            child: const LoadingApp(
              page: LoginPass(title: "Esto es una prueba"),
            ),
          ),
     ),*/

     //initialRoute: RoutesConfig.login,
     //routes: RoutesConfig().buildRoutes(context),
     //onGenerateRoute: _generateRoute,
    );
  }

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: RoutesPaths.init,
        builder: (context, state) =>  Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: LoadingApp(
            page: LoginPass(title: "Esto es una prueba"),
          ),
        ),
      ),
      GoRoute(
          path: RoutesPaths.home,
          builder: (context, state) => HomePage(title: "")
      ),
      GoRoute(
        path: RoutesPaths.login,
        builder: (context, state) => LoginPass(title: "")
      ),
      GoRoute(
        path: RoutesPaths.album_detail, builder: (context, state) {final album = state.extra as Map<String, String>;
          return AlbumDetailPage(album: album);
        },
      ),
    ],
  );

}



