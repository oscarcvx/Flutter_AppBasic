import 'package:flutter/material.dart';

class LoadinAppSpinner extends StatefulWidget{
  const LoadinAppSpinner({super.key});

  @override
  State<LoadinAppSpinner> createState() => _LoadinAppSpinnerState();
}

class _LoadinAppSpinnerState extends State<LoadinAppSpinner> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> children;

    children = const <Widget>[
      SizedBox(
        width: 60,
        height: 60,
        child: CircularProgressIndicator(),
      ),
      Padding(
        padding: EdgeInsets.only(top: 16),
        child: Text('Cargando ,Favor Espere...'),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.lime[100],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
