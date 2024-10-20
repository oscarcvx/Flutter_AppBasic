import 'package:flutter/cupertino.dart';

import '../routes/album_sreen.dart';
import '../routes/home_page.dart';
import '../routes/login_pass.dart';

class RoutesConfig {
  static const String login = '/';
  static const String home = '/home';
  static const String album_screen = '/album_screen';


/*
  Map<String, WidgetBuilder> ConfigureRoutes() {
    return {
      RoutesConfig.login: (context) => LoginPass(title: ""),
      RoutesConfig.home: (context) => HomePage(title: ""),
      RoutesConfig.album_screen: (context) => AlbumScreen(),
    };
  }


  Map<String, Widget Function(BuildContext)> buildRoutes(BuildContext context) {
    return {
      RoutesConfig.login: (context) => LoginPass(title: ""),
      RoutesConfig.home: (context) => HomePage(title: ""),
      RoutesConfig.album_screen: (context) => AlbumScreen(),
    };
  }

*/
/*Route<dynamic> _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => LoginPass(title: '',));
      case '/home':
        return MaterialPageRoute(builder: (context) => HomePage(title: '',));
      case '/album_screen':
        return MaterialPageRoute(builder: (context) => AlbumScreen());
      default:
        return MaterialPageRoute(builder: (context) => LoginPass(title: '',));
    }
  }*/

}