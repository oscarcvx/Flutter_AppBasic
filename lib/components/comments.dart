import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 54, 60, 66),
            borderRadius: BorderRadius.circular(10), // Bordes redondeados
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Usuario Destacado : Rodrigo Carvajal',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 212, 214, 213),
                      ),
                    ),
                  ),
                  Text(
                    'Usuario Destacado : Rodrigo Carvajal'
                        '\nt'
                        '\nr'
                        '\nwewe',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 212, 214, 213),
                    ),
                  ),
                  Text(
                    'You have pushed the button this many times: awe aweqawed'
                        '\nawd '
                        '\na'
                        '\nw d'
                        '\naw '
                        '\nda'
                        '\nw d'
                        '\n'
                        '\n'
                        '\naw dawdawdaw dawd awd awd awd awd awd aw awd awd awd awd awd awd aw'
                        '\nawd awd '
                        '\nawd '
                        '\naw d'
                        '\naw'
                        '\nd'
                        '\nwd '
                        '\naw d'
                        '\nawd awd awd awd awd awd awd awd aw',
                    style: TextStyle(color: Color.fromARGB(255, 212, 214, 213)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Ponle nota a esta valoración : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 212, 214, 213),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Color.fromARGB(255, 192, 190, 5)),
                            Icon(Icons.star, color: Color.fromARGB(255, 192, 190, 5)),
                            Icon(Icons.star, color: Color.fromARGB(255, 192, 190, 5)),
                            Icon(Icons.star, color: Color.fromARGB(255, 192, 190, 5)),
                            Icon(Icons.star_border_sharp, color: Color.fromARGB(255, 212, 214, 213)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
