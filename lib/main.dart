import 'package:basic_app/routes/album_sreen.dart';
import 'package:basic_app/routes/login_pass.dart';
import 'package:basic_app/services/audio_player_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'loading_app/loading_app.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/*void main() =>  runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AudioPlayerService()),
    ],
    child: MyApp(),
  ),

);*/

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioPlayerService()),
      ],
      child: MyApp(),
    ),
  );

// Restore state from local storage
  /*var currentState = getState('currentPage') ?? '/';
  navigateTo(MyApp(), currentState);*/

  /*html.window.onPopState.listen((event) {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop();
    } else {
      html.window.history.back();
    }
  });*/

/*
// Handle browser back and forward buttons
  html.window.onPopState.listen((event) {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop();
    } else {
      html.window.history.back();
    }
  });

  html.window.onBeforeUnload.listen((event) {
    //event = 'Are you sure you want to leave this page?';
  });*/

}
/*
void saveState(String key, String value) {
  html.window.localStorage[key] = value;
}

String? getState(String key) {
  return html.window.localStorage[key];
}
*/
/*
void navigateTo(Widget page, String path, {Map<String, String>? params}) {
  var url = path;
  if (params != null && params.isNotEmpty) {
    var queryParams = params.entries.map((e) => '${e.key}=${e.value}').join('&');
    url = '$path?$queryParams';
  }
  html.window.history.pushState(null, '', url);
  navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => page));
}*/
/*
void navigateTo(Widget page, String path) {
  html.window.history.pushState(null, '', path);
  navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => page));
}*/
/*
void navigateTo(Widget page, String path) {
  saveState('currentPage', path);
  html.window.history.pushState(null, '', path);
  navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => page));
}
*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
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
      ),
      home: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: const LoadingApp(
              page: LoginPass(title: "Esto es una prueba"),
            ),
          ),
        ),
     //initialRoute: RoutesConfig.login,
     //routes: RoutesConfig().buildRoutes(context),
     //onGenerateRoute: _generateRoute,
      onGenerateRoute: _generateRoute,
    );
  }


  Route<dynamic> _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginPass(title: "title"));
      case '/album':
        return MaterialPageRoute(builder: (context) => AlbumScreen());
      default:
        return MaterialPageRoute(builder: (context) => LoginPass(title: "title"));
    }
  }

/*
  void navigateTo(Widget page, String path) {
    html.window.history.pushState(null, '', path);
    navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => page));
  }
*/



}



