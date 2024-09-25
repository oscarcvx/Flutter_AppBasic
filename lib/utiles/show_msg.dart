
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';


enum AlertType { success, danger, warning, info }

class ShowMsg {

  ShowMsg(this.context);
  final BuildContext context;

  double title_font_size = 26.0;
  double message_font_size = 20.0;


  showAlert( String titulo, String mensaje,{Function? okButtom, AlertType alertType = AlertType.success}) async {
    try {
      await showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.rectangle),
                child: _showAlert(
                    titulo, mensaje.replaceAll("Exception: ", ""),
                    okButtom: okButtom),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const SizedBox();
        },
      );
    } on Exception catch (e) {
      String msg = e.toString();
      if (kDebugMode) {
        print("Dialogo showAlert: $msg");
      }
    }
  }

  showConfirm(String titulo, String mensaje,{Function? okButtom,Function? cancelButtom, AlertType alertType = AlertType.success}) async {
    try {
      await showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  //color: const Color(0x1FF8F8F8),
                ),
                child: _showConfirm(
                    titulo,
                    mensaje.replaceAll("Exception: ", ""),
                    okButtom: okButtom, cancelButtom: cancelButtom),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return SizedBox();
        },
      );
    } on Exception catch (e) {
      String msg = e.toString();
      if (kDebugMode) {
        print("Problema dialogo _showConfirm: $msg");
      }
    }
  }




  _showAlert(String titulo, String mensaje,{Function? okButtom}) {
    return AlertDialog(
      elevation: 5,
      backgroundColor: Colors.white,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      title: Text(
        titulo,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: title_font_size,
            color: Colors.grey.shade800,
        )
      ),
      content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0x1FF8F8F8),
                /*boxShadow: [
                      BoxShadow(color: Colors.green, spreadRadius: 3),
                    ],*/
                //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0), bottomRight: Radius.circular(80.0), topLeft: Radius.circular(80.0)),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 2,
                ),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    //reverse: true,
                    child: Text(
                      mensaje,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: message_font_size,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
      //semanticLabel: "sdad",
      titleTextStyle: const TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15, bottom: 0.0),
          child: customButton(context,
              txtBtn: "Ok",
              height: 45.0,
              width: 120.0,
              btnColor: Colors.lightGreen,
              icon: Icon(
                Icons.check,
                color: Colors.green[900],
              ), onPressed: () {
            if (okButtom != null) okButtom();
            Navigator.of(context).pop();
          }),
        ),
      ],
    );
  }

  _showConfirm(String titulo, String mensaje, {Function? okButtom, Function? cancelButtom}) {
    return AlertDialog(
      elevation: 5,
      backgroundColor: Colors.white,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      title: Text(
        titulo,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: title_font_size
        ),
      ),
      content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0x1FF8F8F8),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80.0),
                    bottomRight: Radius.circular(80.0),
                    topLeft: Radius.circular(80.0)),
              ),
              child: new ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 2,
                ),
                child: new Scrollbar(
                  child: new SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      mensaje,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: message_font_size),
                    ),
                  ),
                ),
              ),
            ),
          ]),
      titleTextStyle: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 5.0, bottom: 1.0),
          child: customButton(context,
              txtBtn: "Si",
              height: 45.0,
              width: 140.0,
              btnColor: Colors.lightGreen,
              icon: Icon(
                Icons.check,
                color: Colors.green[900],
              ), onPressed: () {
            if (okButtom != null) okButtom();
            Navigator.of(context).pop();
          }),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10, bottom: 1.0),
          child: customButton(context,
              txtBtn: "No",
              height: 45.0,
              width: 140.0,
              btnColor: Colors.redAccent,
              icon: Icon(
                Icons.close,
                color: Colors.green[900],
              ), onPressed: () {
            if (cancelButtom != null) cancelButtom();
            Navigator.of(context).pop();
          }),
        ),
      ],
    );
  }

  showCustomAlertDialog(
      { String? title,
      String? message,
      Function? btnActivatePassword,
      Color? btnActivatePasswordColor,
      Function? btnRetry,
      Color? btnRetryColor,
      Function? btnCancel,
      Color? btnCancelColor,
      Function? btnAccept,
      Color? btnAcceptColor}) async
  {
    try {
      await showGeneralDialog(
        transitionBuilder: (context, anim1, anim2, child) {
          return Transform.scale(
            scale: anim1.value,
            child: Opacity(
              opacity: anim1.value,
              child: child,
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (_, __, ___) {
          return _showCustomAlertDialog(
              context: context,
              title: title,
              message: message,
              btnActivatePassword: btnActivatePassword,
              btnActivatePasswordColor: btnActivatePasswordColor,
              btnRetry: btnRetry,
              btnRetryColor: btnRetryColor,
              btnCancel: btnCancel,
              btnCancelColor: btnCancelColor,
              btnAccept: btnAccept,
              btnAcceptColor: btnAcceptColor);
        },
      );
    } on Exception catch (e) {
      String msg = e.toString();
      if (kDebugMode) {
        print("Problema dialogo _showCustomAlertDialog: $msg");
      }
    }
  }

  _showCustomAlertDialog(
      {required BuildContext context,
      String? title,
      String? message,
      Function? btnActivatePassword,
      Color? btnActivatePasswordColor,
      Function? btnRetry,
      Color? btnRetryColor,
      Function? btnCancel,
      Color? btnCancelColor,
      Function? btnAccept,
      Color? btnAcceptColor})
  {
    return AlertDialog(
      elevation: 6,
      backgroundColor: Colors.white,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      title: Row(
        children: [
          ///Title
          title != null ? Text(title) : SizedBox(),
          Spacer(),

          ///Close button
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close, color: Colors.black54))
        ],
      ),
      titleTextStyle: TextStyle(
          fontSize: 34.0,
          color: Colors.black,
          fontWeight: FontWeight.bold),
      content: Container(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle, color: const Color(0x1FF8F8F8)),
                child: new ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 2,
                  ),
                  child: new Scrollbar(
                    child: new SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: message != null
                          ? Text(message,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 28.0))
                          : SizedBox(),
                    ),
                  ),
                ),
              ),
            ]),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ///Cancel button
              if (btnCancel != null)
                Flexible(
                  child: customButton(context,
                      txtBtn: 'Cancelar',
                      //height: 52,
                      btnColor: btnCancelColor ?? Colors.grey, onPressed: () {
                    btnCancel();
                  }),
                ),

              ///Activate/Recover password button
              if (btnActivatePassword != null)
                customButton(context,
                    txtBtn: 'Activa tu clave',
                    //height: 52,
                    width: 218.0,
                    btnColor: btnActivatePasswordColor ?? Colors.grey,
                    onPressed: () {
                  btnActivatePassword();
                }),

              ///Retry button
              if (btnRetry != null)
                customButton(context,
                    txtBtn: 'Re-intentar',
                    //height: 52,
                    btnColor: btnRetryColor ?? Colors.blue[900]!,
                    onPressed: () {
                  btnRetry();
                }),

              ///Accept button
              if (btnAccept != null)
                customButton(context,
                    txtBtn: "Aceptar",
                    //height: 52,
                    btnColor: btnAcceptColor ?? Colors.blue[900]!,
                    icon: Icon(
                      Icons.check,
                      color: Colors.lightBlue,
                    ), onPressed: () {
                  btnAccept();
                }),
            ],
          ),
        ),
      ],
    );
  }
}
