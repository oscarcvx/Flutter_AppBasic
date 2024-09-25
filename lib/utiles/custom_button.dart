import 'package:flutter/material.dart';

Widget customButton(

  BuildContext context, {
  Icon? icon,
  Function()? onPressed,
  String txtBtn = "Ok",
  double width = 150.0,
  double height = 45.0,
  double fontSize = 16.0,
  Color btnColor = Colors.blue,
  Color fontColor = Colors.white,
  bool showLoading = false,
  double borderRadius = 5.0,
  double elevation = 2.0,
  Color borderColor = Colors.transparent,
  double borderWidth = 0.0,
}) {

  Color colorLoadingSpinner = Colors.white70;


  return MaterialButton(
    focusElevation: 2.0,
    disabledElevation: 2.0,
    elevation: elevation,
    shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(borderRadius),
        side: BorderSide(color: borderColor, width: borderWidth)),
    minWidth: width,
    height: height,
    padding: const EdgeInsets.all(5),
    color: btnColor,
    onPressed: showLoading ? () {} : onPressed,
    child: SizedBox(
      width: width,
      child: Row(
          //mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            if (!showLoading && icon != null) icon,
            showLoading
                ? SizedBox(
                    //width: height ,
                    //height: height,
                    child: CircularProgressIndicator(
                      color: colorLoadingSpinner,
                      strokeWidth: 5.0
                    ),
                  )
                : Text(txtBtn,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: fontColor,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize)),
          ]),
    ),
  );
}
