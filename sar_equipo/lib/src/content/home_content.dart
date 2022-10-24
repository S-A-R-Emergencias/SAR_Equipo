import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeContent extends StatelessWidget{
  const HomeContent({Key? key }):super(key: key);

  @override
  Widget build(BuildContext context){
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
                                        fontSize: 37,
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
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Text(
                                              'Ninguna',
                                              style: TextStyle(
                                                color: Color.fromRGBO(34, 40, 49, 1),
                                                fontFamily: 'Nunito',
                                                fontSize: 25,
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
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Text(
                                              'ORH+',
                                              style: TextStyle(
                                                color: Color.fromRGBO(34, 40, 49, 1),
                                                fontFamily: 'Nunito',
                                                fontSize: 25,
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
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold
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
                                      fontSize: 25,
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