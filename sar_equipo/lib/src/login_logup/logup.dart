import 'dart:async';
import 'dart:html';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sar_equipo/Models/person_model.dart';
import 'package:sar_equipo/Models/personnel_model.dart';
import 'package:sar_equipo/constans.dart';
import 'package:sar_equipo/src/global/environment.dart';
import 'package:sar_equipo/src/login_logup/login.dart';
import 'package:sar_equipo/src/main_web_page.dart';
import 'package:sar_equipo/src/services/personnel_service.dart';

void main() => runApp(MyApp());

final elevatedButtonStyle = ElevatedButton.styleFrom(
  shadowColor: Color.fromARGB(255, 52, 55, 66),
  backgroundColor: Color.fromARGB(255, 52, 55, 66),
  foregroundColor: Colors.white,
  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  elevation: 10.0,
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'login', home: const Logup(titleName: 'Funcionando'));
  }
}

class Logup extends StatefulWidget {
  const Logup({Key? key, required this.titleName}) : super(key: key);

  final String titleName; //declared variable

  @override
  State<Logup> createState() => _LogupState();
}

class _LogupState extends State<Logup> {
  final Personnel personnel = Personnel();

  Future<http.Response> logup() async {
    personnel.role = "1";
    PersonnelService service = PersonnelService();
    final response = service.postPerson(personnel);
    return (response);
  }

//
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double _height_container = _height * 0.9;
    double _width_container = _width * 0.9;
    double espacio = 15.0;

    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromARGB(255, 143, 77, 16),
      child: Center(
        child: Container(
          width: (_width_container),
          height: (_height_container),
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

                    //Email InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: InputBorder.none,
                              icon: Icon(Icons.email),
                            ),
                            onChanged: (value) {
                              personnel.email = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //Email End

                    SizedBox(
                      height: espacio,
                    ),

                    //Name InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Nombre',
                              border: InputBorder.none,
                              icon: Icon(Icons.person),
                            ),
                            onChanged: (value) {
                              personnel.name = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //Name End

                    SizedBox(
                      height: espacio,
                    ),

                    //LastName InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Primer Apellido',
                              border: InputBorder.none,
                              icon: Icon(Icons.person),
                            ),
                            onChanged: (value) {
                              personnel.lastName = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //LastName End

                    SizedBox(
                      height: espacio,
                    ),

                    //SecondLastName InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Segundo Apellido',
                              border: InputBorder.none,
                              icon: Icon(Icons.person),
                            ),
                            onChanged: (value) {
                              personnel.secondLastName = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //SecondLastName End

                    SizedBox(
                      height: espacio,
                    ),

                    //BirthDate InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Fecha de Nacimiento',
                              border: InputBorder.none,
                              icon: Icon(Icons.date_range),
                            ),
                            onChanged: (value) {
                              personnel.birthDate = DateTime.parse(value);
                            },
                          ),
                        ),
                      ),
                    ),
                    //BirthDate End

                    SizedBox(
                      height: espacio,
                    ),

                    //CI InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Numero de Carnet',
                              border: InputBorder.none,
                              icon: Icon(Icons.card_membership),
                            ),
                            onChanged: (value) {
                              personnel.ci = int.parse(value);
                            },
                          ),
                        ),
                      ),
                    ),
                    //CI End

                    SizedBox(
                      height: espacio,
                    ),

                    //Telephone InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Telefono',
                              border: InputBorder.none,
                              icon: Icon(Icons.phone),
                            ),
                            onChanged: (value) {
                              personnel.telephone = int.parse(value);
                            },
                          ),
                        ),
                      ),
                    ),
                    //Telephone End

                    SizedBox(
                      height: espacio,
                    ),

                    //Password InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              border: InputBorder.none,
                              icon: Icon(Icons.password),
                            ),
                            onChanged: (value) {
                              personnel.password = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //Password End

                    SizedBox(
                      height: espacio,
                    ),

                    //VPassword InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Vuelve a escribir tu contraseña',
                              border: InputBorder.none,
                              icon: Icon(Icons.password),
                            ),
                            onChanged: (value) {
                              personnel.password = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //VPassword End

                    SizedBox(
                      height: espacio + 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonTheme(
                          child: TextButton(
                            style: elevatedButtonStyle,
                            onPressed: () => {
                              logup().then((value) => {
                                    if (value.statusCode == 200 ||
                                        value.statusCode == 204)
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    MainWebPage()))),
                                      }
                                    else
                                      {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              "No se puedo realizar el registro"),
                                        ))
                                      }
                                  }),
                            },
                            child: const Text(
                              "Sing Up",
                              style: TextStyle(
                                  color: Color(0xB8F7F7F8),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),

                        //Login
                        ButtonTheme(
                          child: TextButton(
                            style: elevatedButtonStyle,
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          Login(titleName: 'Log In')))),
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Color(0xB8F7F7F8),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //Columna 2
              Container(
                width: _height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: espacio + 62,
                    ),

                    //Address InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Dirreccion',
                              border: InputBorder.none,
                              icon: Icon(Icons.grade),
                            ),
                            onChanged: (value) {
                              personnel.address = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //Grade End

                    SizedBox(
                      height: espacio,
                    ),

                    //Grade InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Grado',
                              border: InputBorder.none,
                              icon: Icon(Icons.grade),
                            ),
                            onChanged: (value) {
                              personnel.grade = value.toString();
                            },
                          ),
                        ),
                      ),
                    ),
                    //Grade End

                    SizedBox(
                      height: espacio,
                    ),

                    //BloodType InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Tipo de Sangre',
                              border: InputBorder.none,
                              icon: Icon(Icons.bloodtype),
                            ),
                            onChanged: (value) {
                              personnel.bloodType = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //BloodType End

                    SizedBox(
                      height: espacio,
                    ),

                    //Allergie InputText
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Alergia',
                              border: InputBorder.none,
                              icon: Icon(Icons.dangerous),
                            ),
                            onChanged: (value) {
                              personnel.allergies = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    //Allergie End
                  ],
                ),
              ),
              Container(
                  width: _width_container * 0.3,
                  height: _height,
                  // color: Colors.red,
                  child: (Center(
                    child: Image.asset(
                      "assets/images/sar.png",
                      height: _height,
                      width: _width_container * 0.3,
                      fit: BoxFit.cover,
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
