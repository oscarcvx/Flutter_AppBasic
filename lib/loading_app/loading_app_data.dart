import 'dart:async';

class LoadinAppData {

  //Carga information antes de cargar formulario principal
  ///
  ///
  static Future<bool> initApp() async
  {

    print("Cargando..");

    await Future.delayed(Duration(seconds: 5));

    print("Cargado");

    //throw "Esto es un error de prueba";
    return true;
  }

}


