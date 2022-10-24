import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

final elevatedButtonStyle = ElevatedButton.styleFrom(
  shadowColor: Color.fromARGB(255, 52, 55, 66),
  backgroundColor: Color.fromARGB(255, 52, 55, 66),
  foregroundColor: Colors.white,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  elevation: 10.0,
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'login', home: const Login(titleName: 'Funcionando'));
  }
}

class Login extends StatefulWidget {
  const Login({Key? key, required this.titleName}) : super(key: key);

  final String titleName; //declared variable

  @override
  State<Login> createState() => _LoginPage();
}

class _LoginPage extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double _height_container = _height * 0.7;
    double _width_container = _width * 0.6;
    double espacio = 30.0;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 143, 77, 16),
        child: Center(
          child: Container(
            width: _width_container,
            height: _height_container,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(40),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            child: Row(
              children: [
                Container(
                    width: _width_container * 0.467,
                    height: _height,
                    color: Colors.red,
                    child: (Center(
                      child: Image.asset(
                        "assets/login.jpg",
                        height: _height,
                        width: _width_container * 0.468,
                        fit: BoxFit.cover,
                      ),
                    ))),
                Container(
                  width: _height * 0.53,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'BIENVENIDO AL SAR',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      _MyInput("Correo"),
                      SizedBox(
                        height: espacio,
                      ),
                      _MyInput("Contraseña"),
                      SizedBox(
                        height: espacio,
                      ),
                      _MyInput("Carnet"),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _MyButton("Crear"),
                          SizedBox(
                            width: 60,
                          ),
                          _MyButton("Iniciar"),
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
    );
  }

  Widget _MyInput(String texto) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          width: 400,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              // icon: Icon(Icons.email),
              hintText: texto,
              // labelText: 'albertlive.122.com'
            ),
          ),
        );
      },
    );
  }

  Widget _MyButton(String texto) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
            child: Text(
              texto,
              style: TextStyle(color: Colors.white),
            ),
          ),
          style: elevatedButtonStyle,
          onPressed: () {},
        );
      },
    );
  }
}
