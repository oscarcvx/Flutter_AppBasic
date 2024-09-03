import 'package:flutter/material.dart';

class LoadinAppSpinner extends StatelessWidget{
  const LoadinAppSpinner({super.key});

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
        child: Text('Awaiting result...'),
      ),
    ];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }



}
