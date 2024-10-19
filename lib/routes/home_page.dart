import 'package:basic_app/routes/error_view.dart';
import 'package:basic_app/route_gen/go_route.dart';
import 'package:basic_app/utiles/show_msg.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      bottomNavigationBar: MusicPlayerFooter(),
      extendBodyBehindAppBar: true,
      //backgroundColor: Color.fromARGB(20, 0, 0, 0),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 80, // Altura del toolbar para agrandar los íconos
        //backgroundColor: Colors.blue,
        backgroundColor: Color.fromARGB(40, 0, 0, 0),
        shadowColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly, // Ajusta el tamaño del Row para que sea mínimo
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home, size: 40,color: Color.fromARGB(255,212, 214, 213),), // Icono más grande
                tooltip: 'Home',
                onPressed: () {
                  // Acción para Home
                },
              ),
              SizedBox(width: 10), // Espacio entre los íconos
              IconButton(
                icon: Icon(Icons.search, size: 40,color: Color.fromARGB(255,212, 214, 213)), // Icono más grande
                tooltip: 'Buscar',
                onPressed: () {
                  // Acción para Buscar
                },
              ),
              SizedBox(width: 10), // Espacio entre los íconos
              IconButton(
                icon: Icon(Icons.settings, size: 40,color: Color.fromARGB(255,212, 214, 213)), // Icono más grande
                tooltip: 'Config.',
                onPressed: () {
                  // Acción para Configuración
                },
              ),
              SizedBox(width: 30),
            ],
          ),
        ),
      ),

      body: ListView(
             //padding: EdgeInsets.all(16.0),
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            children: <Widget>[

              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Container(
                    //width: 100,
                
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 54,60,66),
                      borderRadius: BorderRadius.circular(10), // Bordes redondeados
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 20),
                      child: Column(
                        children: [

                        Container(
                          width: MediaQuery.of(context).size.width,
                          //color: Colors.deepOrange,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text("Usuario Destacado : Rodrigo Carvajal",
                                textAlign:TextAlign.left,
                                style: TextStyle(
                                      fontSize: 17,
                                      fontWeight:FontWeight.bold ,
                                      color: Color.fromARGB(255,212, 214, 213),

                                  ),
                              ),
                          ),
                        ),


                          const Text(
                            softWrap: true,
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
                            style: TextStyle(color: Color.fromARGB(255,212, 214, 213)),
                          ),


                          const Padding(
                            padding: EdgeInsets.only(top: 25.0,bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Ponle nota a esta valoración : ",style: TextStyle(fontWeight:FontWeight.bold ,color: Color.fromARGB(255,212, 214, 213))),
                                Row(children: [
                                  Icon(Icons.star,color: Color.fromARGB(255, 192,190 , 5),),
                                  Icon(Icons.star,color: Color.fromARGB(255, 192,190 , 5),),
                                  Icon(Icons.star,color: Color.fromARGB(255, 192,190 , 5),),
                                  Icon(Icons.star,color: Color.fromARGB(255, 192,190 , 5),),
                                  Icon(Icons.star_border_sharp,color: Color.fromARGB(255,212, 214, 213)),
                                ],)
                              ],
                            ),
                          )


                        ],
                      ),
                    ),
                  ),
                ),
              ),


              IconButton(
                icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
                iconSize: 58.0,
                onPressed: () {
                  GoRoute(context).to(const ErrorView(mensaje: ''),routeEffect: RouteEffect.CupertinoDefault);
                },
              ),


              IconButton(
                icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
                iconSize: 58.0,
                onPressed: () {
                  GoRoute(context).to(const ErrorView(mensaje: ''),routeEffect: RouteEffect.MaterialDefault);
                },
              ),


              IconButton(
                icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
                iconSize: 58.0,
                onPressed: () {
                  GoRoute(context).to(const ErrorView(mensaje: ''),routeEffect: RouteEffect.Rotation);
                },
              ),

              IconButton(
                icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
                iconSize: 58.0,
                onPressed: () {
                  GoRoute(context).to(const ErrorView(mensaje: ''),routeEffect: RouteEffect.Scale);
                },
              ),

              IconButton(
                icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
                iconSize: 58.0,
                onPressed: () {
                  GoRoute(context).to(const ErrorView(mensaje: ''),routeEffect: RouteEffect.Fade);
                },
              ),

              IconButton(
                icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
                iconSize: 58.0,
                onPressed: () {
                  GoRoute(context).to(const ErrorView(mensaje: ''),routeEffect: RouteEffect.Fade);
                },
              ),


              IconButton(
                icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
                iconSize: 58.0,
                onPressed: () {
                  GoRoute(context).to(const ErrorView(mensaje: ''),routeEffect: RouteEffect.Fade);
                },
              ),



              IconButton(
                icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
                iconSize: 58.0,
                onPressed: () {
                  GoRoute(context).to(const ErrorView(mensaje: ''),routeEffect: RouteEffect.Fade);
                },
              ),


              IconButton(
                icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
                iconSize: 58.0,
                onPressed: () {
                  GoRoute(context).to(const ErrorView(mensaje: ''),routeEffect: RouteEffect.Fade);
                },
              ),


              IconButton(
                icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
                iconSize: 58.0,
                onPressed: () {
                  GoRoute(context).to(const ErrorView(mensaje: ''),routeEffect: RouteEffect.Fade);
                },
              ),




              IconButton(
                icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
                iconSize: 58.0,
                onPressed: () {
                  GoRoute(context).to(const ErrorView(mensaje: ''),routeEffect: RouteEffect.Fade);
                },
              ),



              IconButton(
                icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
                iconSize: 58.0,
                onPressed: () {
                  GoRoute(context).to(const ErrorView(mensaje: ''),routeEffect: RouteEffect.Fade);
                },
              ),


              IconButton(
                icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
                iconSize: 58.0,
                onPressed: () {
                  GoRoute(context).to(const ErrorView(mensaje: ''),routeEffect: RouteEffect.Fade);
                },
              ),


              IconButton(
                icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
                iconSize: 58.0,
                onPressed: () {
                  GoRoute(context).to(const ErrorView(mensaje: ''),routeEffect: RouteEffect.Fade);
                },
              ),


              IconButton(
                icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
                iconSize: 58.0,
                onPressed: () {
                  GoRoute(context).to(const ErrorView(mensaje: ''),routeEffect: RouteEffect.Fade);
                },
              ),



              Row(
                children: [
                  Text("Mensaje danger"),

                  IconButton(
                    icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
                    iconSize: 58.0,
                    onPressed: () {
                      ShowMsg(context).showAlert("titulo", "mensaje",alertType: AlertType.danger);
                    },
                  ),

                ],
              ),

              Row(
                children: [
                  Text("Mensaje success"),

                  IconButton(
                    icon: Icon(Icons.message_outlined,size: 50,color: Colors.indigo),
                    iconSize: 58.0,
                    onPressed: () {
                      ShowMsg(context).showConfirm("titulo", "mensaje",alertType: AlertType.success);
                    },
                  ),

                ],
              ),



            ],
          ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}


class MusicPlayerFooter extends StatefulWidget {
  @override
  _MusicPlayerFooterState createState() => _MusicPlayerFooterState();
}

class _MusicPlayerFooterState extends State<MusicPlayerFooter> {
  double _sliderValue = 0.5; // Valor inicial del slider

  void _onSliderChanged(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.all(0),
      height: 90,
      color: Colors.blueAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  'assets/logos/rockr.png', // Ruta de la imagen de la carátula del álbum
                  width: 60,
                  height: 60,
                ),

                SizedBox(
                  width: 150,
                  child: Text(
                    "ASÑLDKASÑLKD AUI QOWIEUOQW",
                    style: TextStyle(color: Colors.white,),
                    maxLines: 2,
                  ),
                ),


                IconButton(
                  icon: Icon(Icons.skip_previous, color: Colors.white, size: 40),
                  onPressed: () {
                    // Acción para retroceder canción
                  },
                ),
                IconButton(
                  icon: Icon(Icons.play_circle_outline, color: Colors.white, size: 40),
                  onPressed: () {
                    // Acción para reproducir música
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next, color: Colors.white, size: 40),
                  onPressed: () {
                    // Acción para avanzar canción
                  },
                ),
                SizedBox(width: 20), // Espacio adicional
              ],
            ),
          ),

          //SizedBox(width: 20),

          Container(
            child: Align(
              alignment: Alignment.center,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.0), // Tamaño del thumb
                  trackHeight: 2.0, // Altura del track
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 7.0), // Tamaño del overlay
                  valueIndicatorTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                  overlayColor: Colors.blue.withAlpha(32),
                  thumbColor: Colors.white,
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.white54,
                  trackShape: RectangularSliderTrackShape(),
                ),
                child: Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 1,
                  divisions: 100, // Puedes ajustar el número de divisiones según tus necesidades
                  onChanged: _onSliderChanged,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}