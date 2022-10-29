import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/element_model.dart';
import '../providers/element_provider.dart';
import '../providers/elements_provider.dart';

class ElementPage extends StatefulWidget {
  const ElementPage({super.key});

  @override
  State<ElementPage> createState() => _ElementPageState();
}

class _ElementPageState extends State<ElementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elementos'),
        backgroundColor: const Color.fromRGBO(253, 112, 19, 1),
      ),
      body: _listElements(),
    );
  }

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
              return _card(elements[index]);
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
