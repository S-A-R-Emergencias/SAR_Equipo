

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:sar_equipo/main.dart';
import 'package:sar_equipo/src/global/environment.dart';
import 'package:sar_equipo/src/login_logup/login.dart';
import 'package:sar_equipo/src/navigation_bar/nav_bar.dart';
import 'package:sar_equipo/src/product/InsertProduct.dart';
import 'package:sar_equipo/src/product/UpdateProduct.dart';
import '../../Models/element_model.dart';
import '../providers/element_provider.dart';
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
    if(Environment.usersession == null){
      return Login(titleName: 'Log In');
    }else{
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 52, 55, 66),
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
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    IconButton(
                    iconSize: 50,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushNamed(context, '/notification');
                      },
                    ),
                    Container(width: 100,),
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
                    Container(width: 100,),
                    
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
  }
  Widget ElementImage(Element_m e){
    if(e.image==null){
      return Image.network('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',width: 200,height: 200,);
    }
    else{
      return Image.memory(base64Decode(e.image.toString()),width: 200,height: 200,);
    }
  }
  Card _cardGrid(Element_m element) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 30),
        child: Row(
          children: [
            Expanded(
                child: ElementImage(element)),
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
                        Text("Nº Serial: " +element.serialNumber!),
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
          ElementProvider.elements = null;
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
