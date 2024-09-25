import 'package:basic_app/loading_app/loading_app_error.dart';
import 'package:flutter/material.dart';

import 'loading_app_data.dart';
import 'loading_app_spinner.dart';

class LoadingApp extends StatefulWidget{

  const LoadingApp({super.key,required this.page});

  final Widget page;

  @override
  State<LoadingApp> createState() => _LoadingAppState();
}

class _LoadingAppState extends State<LoadingApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<bool>(
      future: LoadinAppData.initApp(),  // Carga de datos iniciales
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          print("Home Cargado");
           return widget.page;
        } else if (snapshot.hasError) {
          print("Ha ocurrido un error");
           return LoadingAppError(mensaje: "${snapshot.error}");
        } else {
          print("Cargando loading");
           return const LoadinAppSpinner();
        }
      },
    );
  }
}



