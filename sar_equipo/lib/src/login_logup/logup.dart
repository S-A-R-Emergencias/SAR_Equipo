import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

final elevatedButtonStyle = ElevatedButton.styleFrom(
      shadowColor:  Color.fromARGB(255, 52, 55, 66),
      backgroundColor: Color.fromARGB(255, 52, 55, 66),
      foregroundColor: Colors.white,
      shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10.0,
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'login', home: const HomePage(titleName: 'Funcionando'));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.titleName}) : super(key: key);

  final String titleName; //declared variable

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double _height_container = _height * 0.7;
    double _width_container = _width * 0.6;
    double espacio = 15.0;

    TextEditingController name = new TextEditingController();
    TextEditingController cellphone = new TextEditingController();
    TextEditingController typeP = new TextEditingController();
    TextEditingController address = new TextEditingController();
    TextEditingController email = new TextEditingController();
    TextEditingController userName = new TextEditingController();
    TextEditingController correo = new TextEditingController();
    TextEditingController password = new TextEditingController();

    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromARGB(255, 143, 77, 16),
      child: Center(
        child: Container(
          width: (_width * 0.55),
          height: (_height * 0.75),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: _height * 0.53,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'CREAR CUENTA S.A.R.',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    _MyInput("Nombre"),
                    SizedBox(
                      height: espacio,
                    ),
                    _MyInput("Apellidos"),
                    SizedBox(
                      height: espacio,
                    ),
                    _MyInput("Sexo"),
                    SizedBox(
                      height: espacio,
                    ),
                    _MyInput("Fecha de Nacimiento"),
                    SizedBox(
                      height: espacio,
                    ),
                    _MyInput("Carnet"),
                    SizedBox(
                      height: espacio,
                    ),
                    _MyInput("Correo"),
                    SizedBox(
                      height: espacio,
                    ),
                    _MyInput("Contraseña"),
                    // _MyPassword("contraseña"),
                    SizedBox(
                      height: espacio,
                    ),
                    _MyInput("Vuelva a ingresar la contraseña"),
                    SizedBox(
                      height: espacio + 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _MyButton("Iniciar Session"),
                        SizedBox(
                          width: 60,
                        ),
                        _MyButton("Crear"),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  width: _width_container*0.467 ,
                  height: _height,
                  // color: Colors.red,
                  child: (Center(
                    child: Image.asset(
                      "assets/login.jpg", height: _height,width: _width_container*0.468, fit: BoxFit.cover,
                  ),
                  ))),
              // Stack(
              //   alignment: const Alignment(0, 1),
              //   children: [
              //     Image.asset(
              //       "assets/login.jpg",
              //       height: _height * 0.65,
              //       width: _width_container*0.5,
              //       fit: BoxFit.cover,
              //     ),]),



            ],
          ),
        ),
      ),
    ));
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

  Widget _date(String texto) {
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

  Widget _MyPassword(String texto){
    return Container(
      margin: EdgeInsets.all(20),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text(texto),
        ),
      ),
    );
  }
  Widget _MyOtherButton(String texto){
    return Container(
      margin: EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: (){},
        child: Text(texto),
        
      ),
    );
  }
}


