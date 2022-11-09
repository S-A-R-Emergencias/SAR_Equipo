import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sar_equipo/Models/element_model.dart';
import 'package:sar_equipo/src/pages/element_web_page.dart';
import '../providers/element_provider.dart';
import '../global/environment.dart';
import '../services/element.service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

final elevatedButtonStyle = ElevatedButton.styleFrom(
  shadowColor: Color.fromARGB(255, 52, 55, 66),
  backgroundColor: Color.fromARGB(255, 52, 55, 66),
  foregroundColor: Colors.white,
  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  elevation: 10.0,
);

class UpdateProduct extends StatefulWidget{
  ElementProvider? provider;
  Element_m elemento;
  UpdateProduct(this.elemento);
  @override
  _ElementState createState() =>_ElementState ();
}
class _ElementState extends State<UpdateProduct>{

    
    ElementService service = new ElementService();

    TextEditingController _name = new TextEditingController();
    TextEditingController _serialNumber = new TextEditingController();
    TextEditingController _amount= new TextEditingController();
    TextEditingController _description= new TextEditingController();
    TextEditingController _unitOfMeasurement= new TextEditingController();
    int _user= 1;
    int _idElementType = 1;
    
    

    Future<void> updateElement() async{
      try{
          // Element_m elEmeneto = await  service.getOneElement(_id);

          Element_m elementM = new Element_m(id: widget.elemento.id , name:_name.text,serialNumber: int.parse(_serialNumber.text),
          amount: int.parse(_amount.text),description: _description.text,unitOfMeasurement: _unitOfMeasurement.text,
          user: _user,idElementType:_idElementType);
          var ress = await service.putElement(elementM);
          // String nada ="";
          ElementProvider.elements = null;
          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => ElementPage()));
      
      }catch(e){
        _name.text = e.toString();
      }   
    }


  int? data;


  final formKey = GlobalKey<FormState>(); //key for form
  @override
  Widget build(BuildContext context){

    // final args = ModalRoute.of(context)!.settings.arguments;
    // data ??= ModalRoute.of(context)?.settings.arguments as int?;
    // _description.text = data.toString();
    _name.text= widget.elemento.name.toString();
    _serialNumber.text= widget.elemento.serialNumber.toString();
    _amount.text= widget.elemento.amount.toString();
    _description.text= widget.elemento.description.toString();
    _unitOfMeasurement.text= widget.elemento.unitOfMeasurement.toString();
    double espacio=30.00;
    final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,

//titulo
      appBar: AppBar(
      centerTitle:true, title: Text ('Actualización de items del SAR'),
      backgroundColor: Color.fromARGB(255, 52, 55, 66),
      ),

  
      body: Center(
        child: Container(
          width: 600,
            child: Column(
              
              children: [      
                  
                  SizedBox(height: espacio*3,),
//agregar texto nombre
                TextField(
                textAlign: TextAlign.center,
                controller: _name,
                decoration: InputDecoration(

                  labelText: "Nombre del Producto",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),

              ),

                SizedBox(height: espacio,),
  //agregar texto descripcion   
                TextField(
                  controller:_serialNumber,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: "Numero Serie",
                    labelStyle: TextStyle(
                      color: Colors.grey,

                      
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: espacio,),
                TextField(
                  controller: _amount,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Cantidad",
                  labelStyle: TextStyle(
                    color: Colors.grey,

                    
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),

                SizedBox(height: espacio,),
                TextField(
                  controller: _description,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Ingrese la descripcion del UpdateProducto",
                  labelStyle: TextStyle(
                    color: Colors.grey,

                    
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),

                SizedBox(height: espacio,),
                TextField(
                  controller:_unitOfMeasurement,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Unidad de medida",
                  labelStyle: TextStyle(
                    color: Colors.grey,

                    
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),

            

                SizedBox(height: espacio,),

              
                  _MyButton("Actualizar Item"),
                  
                          
              ],
              
            ),
          )
      ),
      
    );
  }
    Function RegistroUpdateProducto =(){
  };
  Widget _MyButton(String texto) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            child: Text(
              texto,
              style: TextStyle(color: Colors.white),
            ),
          ),
          style: elevatedButtonStyle,
          onPressed:updateElement,
        );
      },
    );
  }
}

// onPressed:() {
//         Navigator.pushNamed(context, '/Myappdos');
//       },