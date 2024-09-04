import 'package:basic_app/home_page.dart';
import 'package:basic_app/route_gen/go_route.dart';
import 'package:flutter/material.dart';

class UndefinedView extends StatelessWidget {
  final String? name;

  const UndefinedView({
    Key? key,
    this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Route para $name no esta definida'),

            IconButton(
              icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
              iconSize: 58.0,
              onPressed: () {
                GoRoute(context).back();
              },
            ),

            IconButton(
              icon: Icon(Icons.message_outlined,size: 50,color: Colors.amberAccent),
              iconSize: 58.0,
              onPressed: () {
                GoRoute(context).backTo(const HomePage(title: "Vuelta"));
              },
            ),


          ],
        ),
      ),
    );
  }
}
