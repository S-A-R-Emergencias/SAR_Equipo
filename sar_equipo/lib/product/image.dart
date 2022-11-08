import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Imagen extends StatefulWidget{
  @override
  _ImagenState createState() =>_ImagenState ();
}
class _ImagenState extends State<Imagen>{

File? imagen;
final picker = ImagePicker();
Future selImagen(op) async{

var pickedFile;

if(op == 1){
  pickedFile = await picker.getImage(source: ImageSource.camera);

}else{
    pickedFile = await picker.getImage(source: ImageSource.gallery);
}
setState(() {
  if(pickedFile != null ){
    imagen = File(pickedFile.path);

  }else{
    print("No selecionaste ninguna foto");
  }
});

}




    final formKey = GlobalKey<FormState>(); //key for form
   String name="";
   
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
  @override
  Widget build(BuildContext context){
    final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,

//titulo
      appBar: AppBar(
      centerTitle:true, title: Text ('Registro de productos del SAR'),
      ),

  
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(160),
            child: Column(
            key: formKey, //key for form
//btn Agregar imagen
              children: [      
                  ElevatedButton(
                  onPressed:  (){
                    opciones (context);
                  },
                  child: Text ('[+] Agregar imagen del Producto '),
                  ),
                SizedBox(height: 30,),
                imagen == null? Center(): Image.file(imagen !),

//agregar texto nombre
                TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(

                  labelText: "Ingrese nombre del producto",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),

              ),

               SizedBox(height: 30,),
//agregar texto descripcion   
               TextField(
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

                SizedBox(height: 60,),

                  ElevatedButton(
                  onPressed:  (){
                     if (formKey.currentState!.validate()){
                     final snackBar = SnackBar(content: Text('Subb'));
                     }
                  },
                  child: Text ('[V] Registrar productos '),
                  ),
                          
              ],
              
            ),
          )
        ],
      ),
      
    );
  }
}
