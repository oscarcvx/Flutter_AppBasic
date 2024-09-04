library GoRoute;

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

/*enum ReplaceType {
  Replace,
  EndSession,
  BackAndRefresh,
  CloseAll,
  Push,
  BackTo
}*/



class GoRoute{

  GoRoute(this.context);

  final BuildContext context;


  var result;

  Future to( Widget route, {Object? args, RouteEffect routeEffect = RouteEffect.MaterialDefault}) async {
    final RouteArguments vArgs = RouteArguments(context,args,routeEffect: routeEffect);
    final RouteSettings settings = RouteSettings(arguments: vArgs);
    await Navigator.push(
      context,
      _generateRoute(settings,route),
    );
  }

  Future back() async {
      Navigator.of(context).pop();
  }

  /*Future backTo(Widget route, {Object? args, RouteEffect routeEffect = RouteEffect.MaterialDefault}) async {
    final RouteArguments vArgs = RouteArguments(context,args,routeEffect: routeEffect);
    final RouteSettings settings = RouteSettings(arguments: vArgs);
    ///retrocede todo hasta encontrar coincidencia
    Navigator.popUntil(context, (routeP) => routeP.runtimeType == route.runtimeType);

    //Navigator.popUntil(context, ModalRoute.withName(route));
  }*/


  Future backTo(Widget route,{Object? args, RouteEffect routeEffect = RouteEffect.MaterialDefault}) async {
    //-- Cierra todas las ventanas y direcciona a la nueva pagina route_ pagina nueva , "/" : pagina anterior (2 elementos en la lista inicio y pagina nueva)
    final RouteArguments vArgs = RouteArguments(context,args,routeEffect: routeEffect);
    final RouteSettings settings = RouteSettings(arguments: vArgs);
    await Navigator.pushAndRemoveUntil(context, _generateRoute(settings,route), (route) => false);
  }


/*
  Future<Object?> to(BuildContext context, String route, ReplaceType replacement, {Object? args, RouteEffect routeEffect = RouteEffect.MaterialDefault}) async {
    var result;
    if (kDebugMode) {
      print("routeGo $replacement --> " + args.toString());
    }

    switch (replacement) {
      case ReplaceType.BackAndRefresh:

,

      //Cierra la ruta actual y vualve a la ruta anterior refrescando los cambios
        result = await Navigator.of(context).popUntil()route, arguments: RouteArguments(context, args, routeEffect: routeEffect));
        break;

      case ReplaceType.EndSession:
      //-- Cierra todas las ventanas y lleva a la pagina de inicio (cerrar session)
      //globals.user = UsuarioInfo.from();
        result = await Navigator.pushNamedAndRemoveUntil(context, route, (route) => false, arguments: RouteArguments(context, args, routeEffect: routeEffect));
        //Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false, arguments: RouteArguments(context, args, routetype: routetype,tituloWeb: tituloWeb));
        break;

      case ReplaceType.BackTo:
      //elimina todas las rutas cargadas hasta llegar a la ruta indicada que existe entre las rutas cargadas ej: r1, r2 ,r3 ,r4 -- popUntil r2 (elimina r3 y r4)
        Navigator.popUntil(context, ModalRoute.withName(route));
        break;

      case ReplaceType.CloseAll:
      //-- Cierra todas las ventanas y direcciona a la nueva pagina route_ pagina nueva , "/" : pagina anterior (2 elementos en la lista inicio y pagina nueva)
        result = await Navigator.pushNamedAndRemoveUntil(context, route, (route) => false, arguments: RouteArguments(context, args, routeEffect: routeEffect));
        //Push de screen 4 y mantiene screen 1 (las demas rutas se eliminan , se eliminan todas las rutas hasta screen 1)
        //ej : Navigator.of(context).pushNamedAndRemoveUntil('/screen4', ModalRoute.withName('/screen1'));
        break;

      case ReplaceType.Replace:
        Navigator.of(context).popUntil((route) => route.isFirst);
        result = await Navigator.of(context).pushReplacementNamed(route, arguments: RouteArguments(context, args, routeEffect: routeEffect));
        break;

      case ReplaceType.Push:
        result = await Navigator.of(context).restorablePush( ,arguments: RouteArguments(context, args, routeEffect: routeEffect));
        break;

      default:
        result = await Navigator.of(context).pushNamed(route, arguments: RouteArguments(context, args, routeEffect: routeEffect));
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


class RouteArguments {
  Object? arguments;
  RouteArguments(this.context, this.arguments, {this.routeEffect = RouteEffect.MaterialDefault});

  final RouteEffect routeEffect;
  final BuildContext context;
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