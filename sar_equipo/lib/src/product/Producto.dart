import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sar_equipo/Models/element_model.dart';
import 'package:sar_equipo/src/product/UpdateProduct.dart';
import '../services/element.service.dart';

final elevatedButtonStyle = ElevatedButton.styleFrom(
  shadowColor: Color.fromARGB(255, 52, 55, 66),
  backgroundColor: Color.fromARGB(255, 52, 55, 66),
  foregroundColor: Colors.white,
  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  elevation: 10.0,
);

class Product extends StatefulWidget{


  @override
  _ImagenState createState() =>_ImagenState ();
}
class _ImagenState extends State<Product>{



  
    TextEditingController _name = new TextEditingController();
    TextEditingController _serialNumber = new TextEditingController();
    TextEditingController _amount= new TextEditingController();
    TextEditingController _description= new TextEditingController();
    TextEditingController _unitOfMeasurement= new TextEditingController();
    int _user= 1;
    int _idElementType= 1;

    Future<void> insertElement() async{
      try{

        Element_m prod = new Element_m(id: 19,name: "Guantes",serialNumber: 22222,amount: 20,description:"Guantes de bolsa xd update OK",
        unitOfMeasurement: "Unidades",user:1,idElementType: 1);

        Navigator.push(context, MaterialPageRoute(builder:  (context)=> UpdateProduct(prod)));
      
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
      centerTitle:true, title: Text ('Registro de productos del SAR'),
      ),

  
      body: Center(
        child: Container(
          width: 600,
            child: Column(
              
              children: [      
                  SizedBox(height: 200,),
                  _MyButton("No vale esta interfas (IR a INTERFAS DE ELEMENT UPDATE enviando el ID 19)"),
                  
                          
              ],
              
            ),
          )
      ),
      
    );
  }
    Function RegistroProducto =(){
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
          onPressed:insertElement,
        );
      },
    );
  }
}

// onPressed:() {
//         Navigator.pushNamed(context, '/Myappdos');
//       },