import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sar_equipo/Models/element_model.dart';
import 'package:sar_equipo/src/global/environment.dart';
import 'package:sar_equipo/src/login_logup/login.dart';
import '../providers/element_provider.dart';
import '../services/element_service.dart';

final elevatedButtonStyle = ElevatedButton.styleFrom(
  shadowColor: Color.fromARGB(255, 52, 55, 66),
  backgroundColor: Color.fromARGB(255, 52, 55, 66),
  foregroundColor: Colors.white,
  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  elevation: 10.0,
);


class InsertProduct extends StatefulWidget{


  @override
  _ProductState createState() =>_ProductState ();
}
class _ProductState extends State<InsertProduct>{
    TextEditingController _name = new TextEditingController();
    TextEditingController _serialNumber = new TextEditingController();
    TextEditingController _amount= new TextEditingController();
    TextEditingController _description= new TextEditingController();
    TextEditingController _unitOfMeasurement= new TextEditingController();
    int _user=  Environment.usersession!.id!;
    int _idElementType= 1;
    

    final picker = ImagePicker();
    XFile? pickedFile;
    Future selImagen(op) async{
      if(op == 1){
        await picker.pickImage(source: ImageSource.camera).then((value) => pickedFile = value);

      }else{
        await picker.pickImage(source: ImageSource.gallery).then((value) => pickedFile = value);
      }
      if(pickedFile != null ){
          try{
            final bytes = await pickedFile!.readAsBytes();
            insertElement(base64Encode(bytes));
            
          } catch (e) {
            print(e);
          }
        }else{
          SnackBar(
            content: const Text('No ha seleccionado una imagen'),
          );
        }
      }

  opciones (context){
  showDialog(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        contentPadding: EdgeInsets.all(0),
        content: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  selImagen(1);

                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1, color: Colors.orange))
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Tomar una foto ',  style: TextStyle(
                          fontSize: 16
                        ),),
                        ),
                        Icon(Icons.camera_alt, color: Colors.orange)
                    ],
                    ),

                ),
              ),
               InkWell(
                onTap: (){
                  selImagen(2);
                  Navigator.of(context).pop();

                },
                child: Container(
                  padding: EdgeInsets.all(20),
               
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Selecciona una foto',  style: TextStyle(
                          fontSize: 16

                        ),),
                        ),
                        Icon(Icons.image, color: Colors.orange)
                    ],
                    ),

                ),
              ),
               InkWell(
                onTap: (){
                  Navigator.of(context).pop();

                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.red
                  ),

                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Cancelar',  style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                        ), textAlign:TextAlign.center ),
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
  );
}

    Future<void> insertElement(String path) async{
      try{
        Element_m elementM = new Element_m(name:_name.text,serialNumber: int.parse(_serialNumber.text),
        amount: int.parse(_amount.text),description: _description.text,unitOfMeasurement: _unitOfMeasurement.text,
        user: _user,idElementType:_idElementType, image: path);

        ElementService service = new ElementService();
        var res = await service.postElement(elementM);
        ElementProvider.elements = null;
        Navigator.pushNamed(context, '/element');
      
      }catch(e){
        _name.text ="error";
      }    
    }





  final formKey = GlobalKey<FormState>(); //key for form
  String name="";
  @override
  Widget build(BuildContext context){
    double espacio=30.00;
    final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,

//titulo
      appBar: AppBar(
      centerTitle:true, title: Text ('Registro de items del SAR'),
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

                  labelText: "Nombre del producto",
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
                  labelText: "Ingrese la descripcion del producto",
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
                  _MyButton("Registrar Producto"),   
              ],
              
            ),
          )
      ),
      
    );
  }
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
          onPressed:(){opciones(context);},
        );
      },
    );
  }
}