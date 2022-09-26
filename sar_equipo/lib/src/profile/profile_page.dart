import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sar_equipo/src/navigation_bar/nav_bar_button.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Color.fromRGBO(34, 40, 49, 1),
      height: height*1.5,
      width: width,
      child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 73),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'M y\nP r o f i l e',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontFamily: 'Nisebuschgardens',
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    height: height * 0.43,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.72,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 80,
                                    ),
                                    Text(
                                      'Jhon Doe',
                                      style: TextStyle(
                                        color: Color.fromRGBO(34, 40, 49, 1),
                                        fontFamily: 'Nunito',
                                        fontSize: width<=800? 32:37,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Alergias',
                                              style: TextStyle(
                                                color: Color.fromRGBO(34, 40, 49, 1),
                                                fontFamily: 'Nunito',
                                                fontSize: width<=800? 20:25,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Text(
                                              'A la Coca cola',
                                              style: TextStyle(
                                                color: Color.fromRGBO(34, 40, 49, 1),
                                                fontFamily: 'Nunito',
                                                fontSize: width<=800? 20:25,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 25,
                                            vertical: 8,
                                          ),
                                          child: Container(
                                            height: 50,
                                            width: 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Grupo de sangre',
                                              style: TextStyle(
                                                color: Color.fromRGBO(34, 40, 49, 1),
                                                fontFamily: 'Nunito',
                                                fontSize: width<=800? 20:25,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Text(
                                              'ORH+',
                                              style: TextStyle(
                                                color: Color.fromRGBO(34, 40, 49, 1),
                                                fontFamily: 'Nunito',
                                                fontSize: width<=800? 20:25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child:
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.asset(
                                      '/images/profile.png',
                                      width: 190 ,
                                      fit: BoxFit.fitWidth,
                                      ),
                                    ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: height * 0.5,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Mi información',
                            style: TextStyle(
                              color: Color.fromRGBO(34, 40, 49, 1),
                              fontSize: 27,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Divider(
                            thickness: 3.5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Número Celular',
                                    style: TextStyle(
                                      color: Color.fromRGBO(34, 40, 49, 1),
                                      fontFamily: 'Nunito',
                                      fontSize: width<=800? 18:20,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Correo Electronico',
                                    style: TextStyle(
                                      color: Color.fromRGBO(34, 40, 49, 1),
                                      fontSize: width<=800? 18:20,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Fecha de nacimiento',
                                    style: TextStyle(
                                      color: Color.fromRGBO(34, 40, 49, 1),
                                      fontSize: width<=800? 18:20,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Direccion',
                                    style: TextStyle(
                                      color: Color.fromRGBO(34, 40, 49, 1),
                                      fontSize: width<=800? 18:20,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                child: Container(
                                  height: 200,
                                  width: 3,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(100),
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '+591 72658954',
                                    style: TextStyle(
                                      color: Color.fromRGBO(34, 40, 49, 1),
                                      fontFamily: 'Nunito',
                                      fontSize: width<=800? 18:20,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'JhonDow@gmail.com',
                                    style: TextStyle(
                                      color: Color.fromRGBO(34, 40, 49, 1),
                                      fontSize: width<=800? 18:20,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '29/12/2072',
                                    style: TextStyle(
                                      color: Color.fromRGBO(34, 40, 49, 1),
                                      fontSize: width<=800? 18:20,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'En su casa',
                                    style: TextStyle(
                                      color: Color.fromRGBO(34, 40, 49, 1),
                                      fontSize: width<=800? 18:20,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(child:Row(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned.fill(
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: <Color>[
                                                  Color.fromRGBO(253, 112, 19, 1),
                                                  Color.fromRGBO(253, 112, 19, 1),
                                                  Color.fromRGBO(253, 112, 19, 1),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Color.fromRGBO(34, 40, 49, 1),
                                            padding: const EdgeInsets.all(20.0),
                                            textStyle: const TextStyle(fontSize: 20),
                                          ),
                                          onPressed: () {},
                                          child: const Text('Cambiar Contraseña'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned.fill(
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: <Color>[
                                                  Color.fromRGBO(34, 40, 49, 1),
                                                  Color.fromRGBO(34, 40, 49, 1),
                                                  Color.fromRGBO(34, 40, 49, 1),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            padding: const EdgeInsets.all(20.0),
                                            textStyle: const TextStyle(fontSize: 20),
                                          ),
                                          onPressed: () {},
                                          child: const Text('Editar Perfil'),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ),
                              ]
                            )
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}