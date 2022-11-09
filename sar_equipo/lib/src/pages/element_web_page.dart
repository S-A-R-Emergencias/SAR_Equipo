

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:sar_equipo/main.dart';
import 'package:sar_equipo/src/product/InsertProduct.dart';
import 'package:sar_equipo/src/product/UpdateProduct.dart';
import '../../Models/element_model.dart';
import '../providers/element_provider.dart';
import '../providers/elements_provider.dart';
import 'package:flutter/services.dart';

import '../services/element_service.dart';
final elevatedButtonStyle = ElevatedButton.styleFrom(
  shadowColor: Color.fromARGB(255, 52, 55, 66),
  backgroundColor: Color.fromARGB(255, 52, 55, 66),
  foregroundColor: Colors.white,
  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  elevation: 10.0,
);
bool check = false;
class ElementPage extends StatefulWidget {
  const ElementPage({super.key});

  @override
  State<ElementPage> createState() => _ElementPageState();
}

class _ElementPageState extends State<ElementPage> {
  final _elementService = ElementService();
  
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
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
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
                    SizedBox(width: 30,),
                    ElevatedButton(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                          child: Text(
                            "Nuevo Item",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        style:elevatedButtonStyle,
                        onPressed:(){
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => InsertProduct()));
                        },
                      ),
                  ],),
                  
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: _listElements(),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Card _cardGrid(Element_m element) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 30),
        child: Row(
          children: [
            Expanded(
                child: Image.asset(
              'assets/images/traje.jpg',
              width: 200,
              height: 200,
            )),
            Expanded(
                child: Column(
              
                  children: [
                    
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 8,
                          ),
                          child: Container(
                            height: 150,
                            width: 10,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(100),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Text(
                          element.name.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),
                        ),
                        SizedBox(width: 80,),
                        Text(element.description.toString()),
                        SizedBox(width: 80,),
                        Text("Cantidad: " +element.amount.toString()),
                        SizedBox(width: 80,),
                        Text("Nº Serial: " +element.serialNumber.toString()),
                      ],
                    ),
                    rorButtons(element, context),
                  ],
            ))
          ],
        ),
      ),
    );
  }
  Widget _listElements() {
    final elementsProvider = Provider.of<ElementProvider>(context);
    return FutureBuilder<List<Element_m>?>(
      future: elementsProvider.getElements(),
      builder:
          (BuildContext context, AsyncSnapshot<List<Element_m>?> snapshot) {
        if (snapshot.hasData) {
          final elements = snapshot.data;
          return ListView.builder(
            itemCount: elements!.length,
            itemBuilder: (BuildContext context, int index) {
              return _cardGrid(elements[index]);
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _card(Element_m element) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 170,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 3,
                offset: Offset(0, 5),
                spreadRadius: 3)
          ]),
      child: Column(children: [
        Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(element.name.toString(),
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(element.description.toString(),
                    style: TextStyle(fontSize: 15)),
              ],
            ))
      ]),
    );
  }
}

Row rorButtons(Element_m element, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      IconButton(
        icon: Icon(Icons.delete),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 255, 131, 74)),
        ),
        onPressed: () {
          _deleteElement(element);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ElementPage()));
        },
      ),
      IconButton(
        icon: Icon(Icons.edit),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 255, 131, 74)),
        ),
        onPressed: () {
          
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UpdateProduct(element)));
        },
      ),
    ],
  );
}

Widget _deleteElement(Element_m element) {
  final ElementService elementService = ElementService();
  elementService.deleteElement(element);
  return ElementPage();
}
