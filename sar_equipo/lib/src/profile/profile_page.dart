
import 'dart:convert';
import 'dart:io';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sar_equipo/Models/person_model.dart';
import 'package:sar_equipo/src/global/environment.dart';
import 'package:sar_equipo/src/providers/person_provider.dart';
import '../../Models/personnel_model.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
  
}

class _ProfileScreenState extends State<ProfileScreen> {
  final picker = ImagePicker();
  XFile? pickedFile;
  Map<String, String> formData = {
    'image': ''
  };

  @override
  Widget build(BuildContext context) {
    return Profile();
  }

  Future selImagen(op) async{
  if(op == 1){
    await picker.pickImage(source: ImageSource.camera).then((value) => pickedFile = value);

  }else{
    await picker.pickImage(source: ImageSource.gallery).then((value) => pickedFile = value);
  }
  if(pickedFile != null ){
      try{
        final bytes = await pickedFile!.readAsBytes();
        formData['image'] = base64Encode(bytes);
        final response = await http.post(Uri.parse('${Environment.apiURL}/hostImage/1/personnel'), body: jsonEncode(formData),headers: <String,String>{'Content-Type':'application/json; charset=UTF-8' });
        if(response.statusCode == 200 || response.statusCode == 304 || response.statusCode == 201 ){
          SnackBar(
          content: const Text('Foto Actualizada'),);
        }
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
  

Widget Profile(){
  final personProvider = Provider.of<PersonProvider>(context);
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return FutureBuilder<List<Person>?>(
    future: personProvider.getPersons(),
    builder: (_,snapshot) {
          if(snapshot.hasData){
            final persons = snapshot.data;
            final pers = persons![0];
            
            return ListView(children: [
              Container(
              color: Color.fromRGBO(34, 40, 49, 1),
              height: height*1.6,
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
                            height: 10,
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
                          Positioned(
                            left: 0,
                            right: 0,
                            child: Center(
                              child:
                              Column(
                                children: [
                                  ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.asset(
                                    '/images/profile.png',
                                    width: 190 ,
                                    fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Color.fromRGBO(34, 40, 49, 1),
                                          backgroundColor: Color.fromRGBO(253, 112, 19, 1),
                                          padding: const EdgeInsets.all(20.0),
                                          textStyle: const TextStyle(fontSize: 20),
                                        ),
                                        onPressed: () {
                                          opciones(_);
                                          setState(() {});
                                        },
                                        child: const Text('Cambiar Foto'),
                                      ),
                                ]
                              )
                              
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
                                return Positioned(
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: innerHeight * 0.73,
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
                                              "${pers.name} ${pers.lastName} ${pers.secondLastName}",
                                              style: TextStyle(
                                                color: Color.fromRGBO(34, 40, 49, 1),
                                                fontFamily: 'Nunito',
                                                fontSize: width<=800? 32:37,
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
                                                        fontSize: width<=800? 20:25,
                                                        fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                    Text(
                                                      "per.allergies.toString()",
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(34, 40, 49, 1),
                                                        fontFamily: 'Nunito',
                                                        fontSize: width<=800? 20:25,
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
                                                        fontSize: width<=800? 20:25,
                                                        fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                    Text(
                                                      "per.bloodType.toString()",
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(34, 40, 49, 1),
                                                        fontFamily: 'Nunito',
                                                        fontSize: width<=800? 20:25,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
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
                                              fontSize: width<=800? 18:20,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Correo Electronico',
                                            style: TextStyle(
                                              color: Color.fromRGBO(34, 40, 49, 1),
                                              fontSize: width<=800? 18:20,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Fecha de nacimiento',
                                            style: TextStyle(
                                              color: Color.fromRGBO(34, 40, 49, 1),
                                              fontSize: width<=800? 18:20,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Direccion',
                                            style: TextStyle(
                                              color: Color.fromRGBO(34, 40, 49, 1),
                                              fontSize: width<=800? 18:20,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
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
                                            pers.telephone.toString(),
                                            style: TextStyle(
                                              color: Color.fromRGBO(34, 40, 49, 1),
                                              fontFamily: 'Nunito',
                                              fontSize: width<=800? 18:20,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            pers.email.toString(),
                                            style: TextStyle(
                                              color: Color.fromRGBO(34, 40, 49, 1),
                                              fontSize: width<=800? 18:20,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "${pers.birthDate?.day}-${pers.birthDate?.month}-${pers.birthDate?.year}",
                                            style: TextStyle(
                                              color: Color.fromRGBO(34, 40, 49, 1),
                                              fontSize: width<=800? 18:20,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            pers.address.toString(),
                                            style: TextStyle(
                                              color: Color.fromRGBO(34, 40, 49, 1),
                                              fontSize: width<=800? 18:20,
                                              fontFamily: 'Nunito',
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
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(child:Row(children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Stack(
                                              children: <Widget>[
                                                Positioned.fill(
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: <Color>[
                                                          Color.fromRGBO(253, 112, 19, 1),
                                                          Color.fromRGBO(253, 112, 19, 1),
                                                          Color.fromRGBO(253, 112, 19, 1),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                    foregroundColor: Color.fromRGBO(34, 40, 49, 1),
                                                    padding: const EdgeInsets.all(20.0),
                                                    textStyle: const TextStyle(fontSize: 20),
                                                  ),
                                                  onPressed: () {},
                                                  child: const Text('Cambiar Contraseña'),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Stack(
                                              children: <Widget>[
                                                Positioned.fill(
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: <Color>[
                                                          Color.fromRGBO(34, 40, 49, 1),
                                                          Color.fromRGBO(34, 40, 49, 1),
                                                          Color.fromRGBO(34, 40, 49, 1),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                    foregroundColor: Colors.white,
                                                    padding: const EdgeInsets.all(20.0),
                                                    textStyle: const TextStyle(fontSize: 20),
                                                  ),
                                                  onPressed: () {},
                                                  child: const Text('Editar Perfil'),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                      ]
                                    )
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            )
            ],);
          }
          else{
            return const Center(child:  CircularProgressIndicator());
          }
      },
    );
  }
}