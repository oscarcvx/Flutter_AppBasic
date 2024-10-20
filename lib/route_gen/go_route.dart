library GoRoute;

import 'package:basic_app/route_gen/routes_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///Enumeraciones
///
/// Efectos graficos
enum RouteEffect {
  Slide,
  Fade,
  MaterialDefault,
  Scale,
  Rotation,
  Size,
  ScaleRotate,
  CupertinoDefault
}


///
///
///
class GoRoute{

  GoRoute(this.context);

  final BuildContext context;


  //Avanza a la pagina siguiente
  ///
  /// Coloca en la pila la nueva pagina
  Future to( Widget route, {Object? args, RouteEffect routeEffect = RouteEffect.MaterialDefault}) async {
    final RouteArguments vArgs = RouteArguments(context,args,routeEffect: routeEffect);
    final RouteSettings settings = RouteSettings(arguments: vArgs);
    await Navigator.push(context,_generateRoute(settings,route));
  }

  Future toNamedX( String route, {Object? args, RouteEffect routeEffect = RouteEffect.MaterialDefault}) async {
    final RouteArguments vArgs = RouteArguments(context,args,routeEffect: routeEffect);
    final RouteSettings settings = RouteSettings(arguments: vArgs);
    await Navigator.of(context).pushNamed(route, arguments: RouteArguments(context, args, routeEffect: routeEffect));
  }

  //Retrocede la pagina
  ///
  ///  Quita de la pila la pagina actual para acceder a la anterior
  Future back() async {
      Navigator.of(context).pop();
  }

  //Retrocede a una pagina especifica
  ///
  /// Cierra todas las ventanas y direcciona a la nueva pagina
  /// "/" : pagina anterior (2 elementos en la lista inicio y pagina nueva)
  Future backTo(Widget route,{Object? args, RouteEffect routeEffect = RouteEffect.MaterialDefault}) async {
    final RouteArguments vArgs = RouteArguments(context,args,routeEffect: routeEffect);
    final RouteSettings settings = RouteSettings(arguments: vArgs);
    await Navigator.pushAndRemoveUntil(context, _generateRoute(settings,route), (route) => false);
  }

  Future backToNamedX(String route,{Object? args, RouteEffect routeEffect = RouteEffect.MaterialDefault}) async {
    final RouteArguments vArgs = RouteArguments(context,args,routeEffect: routeEffect);
    final RouteSettings settings = RouteSettings(arguments: vArgs);
    //await Navigator.pushAndRemoveUntil(context, _generateRoute(settings,route), (route) => false);
    await Navigator.of(context).popAndPushNamed(route, arguments: RouteArguments(context, args, routeEffect: routeEffect));
  }


  Future replace(Widget route,{Object? args, RouteEffect routeEffect = RouteEffect.MaterialDefault}) async {
    final RouteArguments vArgs = RouteArguments(context,args,routeEffect: routeEffect);
    final RouteSettings settings = RouteSettings(arguments: vArgs);
    await Navigator.pushReplacement(context, _generateRoute(settings,route));
  }

  Future replaceNamedX(String route,{Object? args, RouteEffect routeEffect = RouteEffect.MaterialDefault}) async {
    final RouteArguments vArgs = RouteArguments(context,args,routeEffect: routeEffect);
    final RouteSettings settings = RouteSettings(arguments: vArgs);
    await Navigator.of(context).popAndPushNamed(route, arguments: RouteArguments(context, args, routeEffect: routeEffect));
  }


 /* void navigateTo(Widget page, String path) {
    html.window.history.pushState(null, '', path);
    navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => page));
  }*/

  /*static Route<dynamic> generateRoute(RouteSettings settings) {
    RouteArguments args = settings.arguments as RouteArguments;
    Map<String, Widget Function(BuildContext)> routes = RoutesConfig().buildRoutes(args.context);
    Widget widget = routes[settings.name]!(args.context);
    return _buildRoute(args.context, widget, args, routeType: args.routeEffect);
  }*/


  /*Future backTo(Widget route, {Object? args, RouteEffect routeEffect = RouteEffect.MaterialDefault}) async {
    final RouteArguments vArgs = RouteArguments(context,args,routeEffect: routeEffect);
    final RouteSettings settings = RouteSettings(arguments: vArgs);
    ///retrocede todo hasta encontrar coincidencia
    Navigator.popUntil(context, (routeP) => routeP.runtimeType == route.runtimeType);

    //Navigator.popUntil(context, ModalRoute.withName(route));
  }*/


/*
Future<Object?> routeGo(BuildContext context, String route, replaceType replacement, {Object? args, RouteType routeType = RouteType.MaterialDefault,String tituloWeb=""}) async {
   var result;
  if (kDebugMode) {
    print("routeGo $replacement --> " + args.toString());
  }

  switch (replacement) {
    case replaceType.BackAndRefresh:
      //Cierra la ruta actual y vualve a la ruta anterior refrescando los cambios
      result = await Navigator.of(context).popAndPushNamed(route, arguments: RouteArguments(context, args, routeType: routeType,tituloWeb: tituloWeb));
      break;

    case replaceType.EndSession:
      //-- Cierra todas las ventanas y lleva a la pagina de inicio (cerrar session)
      //globals.user = UsuarioInfo.from();
      result = await Navigator.pushNamedAndRemoveUntil(context, route, (route) => false, arguments: RouteArguments(context, args, routeType: routeType,tituloWeb: tituloWeb));
      //Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false, arguments: RouteArguments(context, args, routetype: routetype,tituloWeb: tituloWeb));
      break;

    case replaceType.BackTo:
      //elimina todas las rutas cargadas hasta llegar a la ruta indicada que existe entre las rutas cargadas ej: r1, r2 ,r3 ,r4 -- popUntil r2 (elimina r3 y r4)
      Navigator.popUntil(context, ModalRoute.withName(route));
      break;

    case replaceType.CloseAll:
      //-- Cierra todas las ventanas y direcciona a la nueva pagina route_ pagina nueva , "/" : pagina anterior (2 elementos en la lista inicio y pagina nueva)
      result = await Navigator.pushNamedAndRemoveUntil(context, route, (route) => false, arguments: RouteArguments(context, args, routeType: routeType,tituloWeb: tituloWeb));
      //Push de screen 4 y mantiene screen 1 (las demas rutas se eliminan , se eliminan todas las rutas hasta screen 1)
      //ej : Navigator.of(context).pushNamedAndRemoveUntil('/screen4', ModalRoute.withName('/screen1'));
      break;

    case replaceType.Replace:
      Navigator.of(context).popUntil((route) => route.isFirst);
      result = await Navigator.of(context).pushReplacementNamed(route, arguments: RouteArguments(context, args, routeType: routeType,tituloWeb: tituloWeb));
      break;

    case replaceType.Push:
      result = await Navigator.of(context).pushNamed(route, arguments: RouteArguments(context, args, routeType: routeType,tituloWeb: tituloWeb));
      break;

    default:
      result = await Navigator.of(context).pushNamed(route, arguments: RouteArguments(context, args, routeType: routeType,tituloWeb: tituloWeb));
      break;
  }
  //print("Resultado : ${result}");
  return result;
}


*/



}



PageRoute _generateRoute(RouteSettings settings,Widget route) {
  RouteArguments args = settings.arguments as RouteArguments;
  return _buildRoute(args.context, route, args, routeType: args.routeEffect);
}

PageRoute _buildRoute(BuildContext context, Widget route, RouteArguments args, {RouteEffect routeType = RouteEffect.MaterialDefault}) {

  late PageRoute pr;

  if (kDebugMode) {
    print("Desde buildRoute : " + args.arguments.toString());
  }

  RouteSettings routeSettings = RouteSettings(arguments: args.arguments);


  switch (routeType) {
    case RouteEffect.ScaleRotate:
      pr = _ScaleRotateRoute(page: route, settings: routeSettings);
      break;

    case RouteEffect.Size:
      pr = _SizeRoute(page: route, settings: routeSettings);
      break;

    case RouteEffect.Fade:
      pr = _FadeRoute(page: route, settings: routeSettings);
      break;

    case RouteEffect.Scale:
      pr = _ScaleRoute(page: route, settings: routeSettings);
      break;

    case RouteEffect.Scale:
      pr = _RotationRoute(page: route, settings: routeSettings);
      break;

    case RouteEffect.MaterialDefault:
      pr = MaterialPageRoute(builder: (context) => route, settings: routeSettings);
      break;

    case RouteEffect.CupertinoDefault:
      pr = CupertinoPageRoute(builder: (context) => route, settings: routeSettings);
      break;

    case RouteEffect.Slide:
      pr = _SlideRightRoute(page: route, settings: routeSettings);
      break;

    default:
      pr = _SlideRightRoute(page: route, settings: routeSettings);
  }

  return pr;
}




///
/// Route Arguments  : Parametros
///

class RouteArguments {
  Object? arguments;
  RouteArguments(this.context, this.arguments, {this.routeEffect = RouteEffect.MaterialDefault});
  final RouteEffect routeEffect;
  final BuildContext context;
}



///
/// Transition Effects
///

class _ScaleRoute extends PageRouteBuilder {
  final Widget page;
  final RouteSettings settings;

  _ScaleRoute({required this.page, required this.settings})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    settings: settings,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        ),
  );
}

class _RotationRoute extends PageRouteBuilder {
  final Widget page;
  final RouteSettings settings;

  _RotationRoute({required this.page, required this.settings})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    settings: settings,
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        RotationTransition(
          turns: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.linear,
            ),
          ),
          child: child,
        ),
  );
}

class _SizeRoute extends PageRouteBuilder {
  final Widget page;
  final RouteSettings settings;

  _SizeRoute({required this.page, required this.settings})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    settings: settings,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        Align(
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        ),
  );
}

class _ScaleRotateRoute extends PageRouteBuilder {
  final Widget page;
  final RouteSettings settings;

  _ScaleRotateRoute({required this.page, required this.settings})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    settings: settings,
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: RotationTransition(
            turns: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.linear,
              ),
            ),
            child: child,
          ),
        ),
  );
}

class _SlideRightRoute extends PageRouteBuilder {

  final Widget page;
  final RouteSettings settings;

  _SlideRightRoute({required this.page, required this.settings})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}

class _FadeRoute extends PageRouteBuilder {
  final Widget page;
  final RouteSettings settings;

  _FadeRoute({required this.page, required this.settings})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    settings: settings,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}