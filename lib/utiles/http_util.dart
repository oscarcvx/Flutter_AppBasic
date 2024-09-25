import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


/*

class HttpUtil {

  //Variables
  late HttpClient client;
  BuildContext? context;

  final bool trustSelfSigned;
  final int timeOutSegundos;


  HttpUtil({this.context, this.timeOutSegundos = 30,this.trustSelfSigned=true}){
    client = HttpClient();
    //Time Out en segundos
    client.connectionTimeout = Duration(seconds: timeOutSegundos);
    //Permite hacer conexiones no seguras
    if (trustSelfSigned)client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
  }


  Future<HttpClientResponse> apiCallPost(String url, {Map? map, String? bearerToken, bool redirectEndSession = true}) async
  {
    late HttpClientResponse response;

    try {
      if (map == null) map = {};


      HttpClientRequest request = await client.postUrl(Uri.parse(url));

      request.headers.set('content-type', 'application/json');
      request.headers.set('Accept', 'application/json');

      if (bearerToken != null && bearerToken.trim() != "") {
        request.headers.set('Authorization', 'Bearer $bearerToken');
      }

      //parametros
      request.add(utf8.encode(json.encode(map)));
      response = await request.close();

      if (kDebugMode) {
        print("apiCallPost : response.statusCode : ${response.statusCode}");
      }

      return response;

    } on SocketException catch (e) {
      String msg = e.message;
      int codigo = e.hashCode;
      if (kDebugMode) {
        print("Error de Conexion : COD:$codigo -> $msg  , $e");
      }

      if (context != null) {
        await AlertDialogs.showAlert(context, "Mensaje",
            "Ha ocurrido un problema , no hay conexión\nfavor intente más tarde");
        await redirect(context);
      }

      /*final usrLogged = globals.user.usrLogged ?? false;
      if(usrLogged) {
        await AlertDialogs.showAlert(context, "Mensaje", "Ha ocurrido un problema , no hay conexión\nfavor intente más tarde");
        await redirect(context);
      }*/
      return response;
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<HttpClientResponse> apiCallPut(String url, BuildContext context,
      {Map? map, String? bearerToken}) async {
    late HttpClientResponse response;

    try {
      bool trustSelfSigned = true; // permito certificados https no validos
      if (map == null) map = {};

      HttpClient client = new HttpClient();
      client.connectionTimeout =
          Duration(seconds: globals.parApiTimeOutSegundos);

      if (trustSelfSigned)
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
      HttpClientRequest request = await client.putUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.headers.set('Accept', 'application/json');
      if (bearerToken != null && bearerToken.trim() != "")
        request.headers.set('Authorization', 'Bearer $bearerToken');
      //parametros
      if (kDebugMode) {
        print("json.encode(map) : ${json.encode(map)}");
      }
      request.add(utf8.encode(json.encode(map)));
      response = await request
          .close(); //.timeout(Duration(seconds: globals.parTimeOutSegundos));
      // String reply = await response.transform(utf8.decoder).join();

      if (kDebugMode) {
        print("apiCallPut : response.statusCode : ${response.statusCode}");
      }

      if (response.statusCode == 401) {
        // end session, no autorizado
        if (kDebugMode) {
          print("globals.user.primerLogin : ${globals.user.primerLogin}");
        }
        await redirect(context);
      }

      return response;
    } on SocketException catch (e) {
      String msg = e.message;
      int codigo = e.hashCode;
      if (kDebugMode) {
        print("Error de Conexion : COD:$codigo -> $msg  , $e");
      }

      if (context != null) {
        await AlertDialogs.showAlert(context, "Mensaje",
            "Ha ocurrido un problema , no hay conexión\nfavor intente más tarde");
        await redirect(context);
      }

      /*final usrLogged = globals.user.usrLogged ?? false;
      if(usrLogged) {
        await AlertDialogs.showAlert(context, "Mensaje", "Ha ocurrido un problema , no hay conexión\nfavor intente más tarde");
        await redirect(context);
      }*/
      return response;
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<HttpClientResponse> apiCallDelete(String url, BuildContext context,
      {Map? map, String? bearerToken}) async {
    late HttpClientResponse response;

    try {
      bool trustSelfSigned = true; // permito certificados https no validos
      if (map == null) map = {};

      HttpClient client = new HttpClient();
      client.connectionTimeout =
          Duration(seconds: globals.parApiTimeOutSegundos);

      if (trustSelfSigned)
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
      HttpClientRequest request = await client.deleteUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.headers.set('Accept', 'application/json');
      if (bearerToken != null && bearerToken.trim() != "")
        request.headers.set('Authorization', 'Bearer $bearerToken');
      //parametros
      print("json.encode(map) : ${json.encode(map)}");
      request.add(utf8.encode(json.encode(map)));
      response = await request
          .close(); //.timeout(Duration(seconds: globals.parTimeOutSegundos));
      // String reply = await response.transform(utf8.decoder).join();

      print("apiCallDelete : response.statusCode : ${response.statusCode}");

      if (response.statusCode == 401) {
        // end session, no autorizado
        print("globals.user.primerLogin : ${globals.user.primerLogin}");
        await redirect(context);
      }

      return response;
    } on SocketException catch (e) {
      String msg = e.message;
      int codigo = e.hashCode;
      print("Error de Conexion : COD:$codigo -> $msg  , $e");

      if (context != null) {
        await AlertDialogs.showAlert(context, "Mensaje",
            "Ha ocurrido un problema , no hay conexión\nfavor intente más tarde");
        await redirect(context);
      }

      /*final usrLogged = globals.user.usrLogged ?? false;
      if(usrLogged) {
        await AlertDialogs.showAlert(context, "Mensaje", "Ha ocurrido un problema , no hay conexión\nfavor intente más tarde");
        await redirect(context);
      }*/
      return response;
    } on Exception catch (e) {
      throw e;
      //return response;
    }
  }

  Future<HttpClientResponse> apiCallGet(String url, BuildContext context,
      {String? bearerToken}) async {
    late HttpClientResponse response;

    try {
      bool trustSelfSigned = true; // permito certificados https no validos

      HttpClient client = new HttpClient();

      client.connectionTimeout =
          Duration(seconds: globals.parApiTimeOutSegundos);

      if (trustSelfSigned)
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
      HttpClientRequest request = await client.getUrl(Uri.parse(
          url)); //.timeout(Duration(seconds: globals.parTimeOutSegundos));
      request.headers.set('content-type', 'application/json');
      request.headers.set('Accept', 'application/json');
      if (bearerToken != null && bearerToken.trim() != "")
        request.headers.set('Authorization', 'Bearer $bearerToken');
      response = await request
          .close(); //.timeout(Duration(seconds: globals.parTimeOutSegundos));
      // String reply = await response.transform(utf8.decoder).join();

      print("apiCallGet : response.statusCode : ${response.statusCode}");

      print('======================');
      print('response.statusCode ' + response.statusCode.toString());
      if (response.statusCode == 401) {
        // end session, no autorizado
        print("globals.user.primerLogin : ${globals.user.primerLogin}");
        await redirect(context);
      }
      print('======================');
      return response;
    } on SocketException catch (e) {
      String msg = e.message;
      int codigo = e.hashCode;

      print("Error de Conexion : COD: $codigo -> $msg , $e");

      if (context != null) {
        await AlertDialogs.showAlert(context, "Mensaje",
            "Ha ocurrido un problema , no hay conexión\nfavor intente más tarde");
        await redirect(context);
      }

      /*final usrLogged = globals.user.usrLogged ?? false;
      if(usrLogged) {
        await AlertDialogs.showAlert(context, "Mensaje", "Ha ocurrido un problema , no hay conexión\nfavor intente más tarde");
        await redirect(context);
      }*/
      return response;
    } on Exception catch (e) {
      throw e;
      //return response;
    }
  }


}
*/