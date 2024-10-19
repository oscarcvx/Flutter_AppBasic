import 'package:basic_app/routes/home_page.dart';
import 'package:flutter/material.dart';

import '../route_gen/go_route.dart';


class LoginPass extends StatefulWidget {
  const LoginPass({Key? key, required String title}) : super(key: key);


  @override
  _LoginPassState createState() => _LoginPassState();
}

class _LoginPassState extends State<LoginPass> {



  Widget _submitButton() {
    return Container(
      width: 300.0,
      height: 40.0,
      //width: MediaQuery.of(context).size.width,
      color: Color.fromARGB(255,212, 214, 213),
      padding: const EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.center,
      child: const Text(
        'Log in',
        style: TextStyle(fontSize: 15, color: Color.fromARGB(255,33, 36, 41),fontWeight: FontWeight.bold),
      ),
    );
  }


  Widget _entryField(String title, {bool isPassword = false,Icon? prefixIcon}) {
    const color = Colors.black;
    const coloFocused = Colors.amber;
    return Container(
      width: 300.0,
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16 , color: Color.fromARGB(255,212, 214, 213)),
          ),
          const SizedBox(
            height: 3,
          ),
          TextField(
            style: TextStyle(color: Color.fromARGB(255,212, 214, 213)),
              obscureText: isPassword,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                border: InputBorder.none,
                fillColor: const Color.fromARGB(255,33, 36, 41),
                filled: true,
                prefixIcon: prefixIcon, //const Icon(Icons.search, color: color),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Color.fromARGB(255,212, 214, 213).withOpacity(0.7) ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: coloFocused.withOpacity(0.7)),
                ),

              )
          )
        ],
      ),
    );
  }


  Widget _rutPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email"),
        const SizedBox(height: 10),
        _entryField("Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;
    return Scaffold(
        //backgroundColor: const Color(0xffe4e9f3),
        body: SizedBox(
          height: height,
          child: Stack(
            children: <Widget>[

            /*  Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(1)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: const Offset(2, 4),
                        blurRadius: 5,
                        spreadRadius: 2)
                  ],
                 // gradient: degradadoLogin(),
                ),
              ),*/



              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[


                  SizedBox(height: height * .2),

                  SizedBox(
                    child: Image.asset('assets/logos/appraise_horizontal_blanco.png'),
                    height: 65.0,
                  ),

                  const SizedBox(height: 85),

                    const Text(
                      'Log in',
                      style: TextStyle(fontSize: 30, color: Color.fromARGB(255,212, 214, 213),fontWeight: FontWeight.bold),
                    ),

                      const SizedBox(height: 10),
                      _rutPasswordWidget(),
                      const SizedBox(height: 20),
                      InkWell(
                          onTap: () {
                            GoRoute(context).to(const HomePage(title: "TEST",),routeEffect: RouteEffect.Fade);
                          },
                          child: _submitButton()
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            GoRoute(context).to(const HomePage(title: "APPRAISE"),routeEffect: RouteEffect.Fade);
                          },
                          child: const Text('Olvidó su contraseña ?',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                      ),
                      // _divider(),
                      // _facebookButton(),
                      // SizedBox(height: height * .055),
                      // _createAccountLabel(),
                    ],
                  ),
                ),
              ),


              //Positioned(top: 30, left: 0, child: backButton(context)),


            ],
          ),
        ));
  }
}


