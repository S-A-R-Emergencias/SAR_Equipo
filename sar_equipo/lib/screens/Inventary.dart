import 'dart:convert'; //convert file
import 'dart:io';//manejo de archivos file

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// convertir  bytes
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;





class Inventory extends StatelessWidget {
  const Inventory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const InventoryScreen(),
    );
  }
}

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}






class _InventoryScreenState extends State<InventoryScreen> {



  Future<File> ConvertImageToBytes(String base64Image, String imageName) async {
    final dir = await getTemporaryDirectory();
    await dir.create(recursive: true);
    final tempFile = File(path.join(dir.path, imageName));
    await tempFile.writeAsBytes(base64.decode(base64Image));
    return tempFile;

  }
  // ImageIcon image;
  
  // ByteArrayInputStream bis = new ByteArrayInputStream(t.getFoto());
  // BufferedImage Imagen = ImageIO.read(bis);
  // portada.setIcon(Imagen);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: const Color(0xFFFD7013),
              ),
            ],
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Title(
                    color: Colors.white,
                    child: Text(
                      'EQUIPAMIENTO',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Card(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 30),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Image.asset(
                                        'assets/images/armario.jpg')),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'ARMARIO BRIGADA BOMBEROS',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        '3 Módulos independientes con 3 puertas de acrilico'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        Text('1')
                                      ],
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 30),
                            child: Row(
                              children: [
                                Expanded(
                                    child:
                                        Image.asset('assets/images/casco.jpg')),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'CASCO PARA BOMBEROS',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        'Cáscara exterior está fabricada en plástico reforzado con fibra de vidrio'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        Text('30')
                                      ],
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 30),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Image.asset(
                                        'assets/images/Equipo.jpg')),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'EQUIPO AUTONOMO DE RESPIRACION',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('Equipos de Respiración autónoma '),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        Text('5')
                                      ],
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 30),
                            child: Row(
                              children: [
                                Expanded(
                                    child:
                                        Image.asset('assets/images/botas.jpg')),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'BOTAS PARA BOMBEROS',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        'Botas para bomberos con el diseño especial más completo para el bombero'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        Text('40')
                                      ],
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 30),
                            child: Row(
                              children: [
                                Expanded(
                                    child:
                                        Image.asset('assets/images/ropa.jpg')),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'EQUIPOS ESTRUCTURALES PARA BOMBEROS',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        'Equipos de protección ignífugos para bomberos de incendios estructurales diseñados en tres capas '),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        Text('30')
                                      ],
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 30),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Image.asset(
                                        'assets/images/armario.jpg')),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'ARMARIO BRIGADA BOMBEROS',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        '3 Módulos independientes con 3 puertas de acrilico'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        Text('1')
                                      ],
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 30),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Image.asset(
                                        'assets/images/armario.jpg')),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'ARMARIO BRIGADA BOMBEROS',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        '3 Módulos independientes con 3 puertas de acrilico'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        Text('1')
                                      ],
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  ListGridEquipment() {
    return GridView.count(
      primary: false,
      padding: EdgeInsets.all(20),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("He'd have you all unravel at the"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[200],
          child: const Text('Heed not the rabble'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[300],
          child: const Text('Sound of screams but the'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[400],
          child: const Text('Who scream'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[500],
          child: const Text('Revolution is coming...'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[600],
          child: const Text('Revolution, they...'),
        ),
      ],
    );
  }

}
