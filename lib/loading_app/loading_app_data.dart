import 'dart:async';

class LoadinAppData {

  static Future<bool> initApp() async
  {

    print("Cargando..");
    await Future.delayed(Duration(seconds: 10));
    print("Cargado");

    throw "Esto es un error de prueba";
    return true;
  }

}


