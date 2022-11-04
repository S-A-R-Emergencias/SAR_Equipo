import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:sar_equipo/main.dart';
import '../../Models/element_model.dart';
import '../providers/element_provider.dart';
import '../providers/elements_provider.dart';
import 'package:flutter/services.dart';

import '../services/element_service.dart';

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

  Card _cardGrid(ElementItem element) {
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  element.name.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(element.description.toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    Text(element.amount.toString()),
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
/*
  Future<void> _deleteElement(ElementItem element) async {
    final response = await _elementService.deleteElement(element);
    if (response.statusCode == 200 || response.statusCode == 304) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Elemento eliminado'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al eliminar elemento'),
        ),
      );
    }
  }*/

  Widget _listElements() {
    final elementsProvider = Provider.of<ElementProvider>(context);
    return FutureBuilder<List<ElementItem>?>(
      future: elementsProvider.getElements(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ElementItem>?> snapshot) {
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

  Widget _card(ElementItem element) {
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

Row rorButtons(ElementItem element, BuildContext context) {
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
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainApp()));
          _deleteElement(element);
        },
      ),
      IconButton(
        icon: Icon(Icons.edit),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 255, 131, 74)),
        ),
        onPressed: () {},
      ),
      /*
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color?>(
              Color.fromARGB(255, 255, 131, 74)),
        ),
        onPressed: () {
          _deleteElement(element);
          Navigator.pushNamed(context, 'element');
        },
        child: Text(
          'Eliminar',
        ),
      ),
      ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color?>(
                  Color.fromARGB(255, 151, 151, 151))),
          onPressed: () {},
          child: Text(
            'Actualizar',
          ))
          */
    ],
  );
}

Widget _deleteElement(ElementItem element) {
  final ElementService elementService = ElementService();
  elementService.deleteElement(element);
  return MainApp();
}
