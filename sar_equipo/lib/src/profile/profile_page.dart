
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sar_equipo/Models/person_model.dart';
import 'package:sar_equipo/src/global/environment.dart';
import 'package:sar_equipo/src/login_logup/login.dart';
import 'package:sar_equipo/src/profile/edit_info.dart';
import 'package:sar_equipo/src/providers/person_provider.dart';
import 'package:sar_equipo/src/services/personnel_service.dart';
import '../../Models/personnel_model.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final picker = ImagePicker();
  XFile? pickedFile;
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  PersonnelService service = PersonnelService();
  
  

  @override
  Widget build(BuildContext context) {
    if(Environment.usersession == null){
      return Login(titleName: 'Log In');
    }else{
    return Profile();
    }
  }

  void CleanInputs(){
    newPasswordController.text = "";
    confirmPasswordController.text = "";
    oldPasswordController.text="";
  }
  //cambio de Contraseña
  Future<void> SavePassword() async {
    String newPassword = newPasswordController.text;
    String confirmPassword = confirmPasswordController.text;
    String oldPassword = oldPasswordController.text;
    if((newPassword!= "" && confirmPassword!= "" && oldPassword!="") && (confirmPassword == newPassword && newPassword != oldPassword)){
      String email = Environment.usersession!.email.toString();
      final response = await http.get(Uri.parse('${Environment.apiURL}/person/login/${email}/${oldPassword}'));
      if(response.statusCode == 200 || response.statusCode == 304){
        service.changePassword(newPassword, Environment.usersession!.id!).then((value) => {
        if(value.statusCode == 200){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Contraseña actualizada correctamente"))),
          CleanInputs()
                                      
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Ha ocurrido un error al actualizar la contraseña")))
        }
      });
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("La contraseña no coincide con la del usuario")));
      }
      
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Las contraseñas no coinciden")));
    }
  }
  //Pop up del cambio de contraseña
  void ChangePassword() {
    showDialog(
    context: context,
    builder: (BuildContext context){
      return ClipRRect(
              borderRadius:
              BorderRadius.circular(20),
              child:AlertDialog(
                contentPadding: EdgeInsets.all(0),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              obscureText: true,
                              controller: oldPasswordController,
                              decoration: InputDecoration(
                                labelText: "Contraseña Anterior",
                                border: InputBorder.none,
                                icon: Icon(Icons.password),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              obscureText: true,
                              controller: newPasswordController,
                              decoration: InputDecoration(
                                labelText: "Contraseña Nueva",
                                border: InputBorder.none,
                                icon: Icon(Icons.password),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              obscureText: true,
                              controller: confirmPasswordController,
                              decoration: InputDecoration(
                                labelText: "Confirmar Contraseña",
                                border: InputBorder.none,
                                icon: Icon(Icons.password_outlined),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          SavePassword().then((value){
                            Navigator.of(context).pop();
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(40, 54, 84, 1)
                          ),

                          child: Row(
                            children: [
                              Expanded(
                                child: Text('Guardar',  style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white
                                ), textAlign:TextAlign.center ),
                                ),
                            ],
                            ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          CleanInputs();
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
                )
      );
    }
  );}
  //imagen del perfil
  Widget ProfileImage(){
    if(Environment.usersession!.image==null){
      return Image.network('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',width: 190,fit: BoxFit.fitWidth,);
    }
    else{
      return Image.memory(base64Decode(Environment.usersession!.image.toString()),width: 190,fit: BoxFit.fitWidth,);
    }
  }
  //Agarre de imagen
  Future selImagen(op) async{
  if(op == 1){
    await picker.pickImage(source: ImageSource.camera).then((value) => pickedFile = value);

  }else{
    await picker.pickImage(source: ImageSource.gallery).then((value) => pickedFile = value);
  }
  if(pickedFile != null ){
      try{
        final bytes = await pickedFile!.readAsBytes();
        Environment.usersession!.image = base64Encode(bytes);
        final response = await service.putPerson(Environment.usersession!);
        if(response.statusCode == 200 || response.statusCode == 304 || response.statusCode == 201 ){
          setState(() {});
          SnackBar(
          content: const Text('Foto Actualizada'),);
        } else {
          SnackBar(
          content: const Text('Actualizacion fallida'),);
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
  return ListView(
              shrinkWrap: true,
              children: [
              Container(
              color: Color.fromRGBO(34, 40, 49, 1),
              height: height*1.5,
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
                          Center(
                              child:
                              Column(
                                children: [
                                  ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: ProfileImage()
                                  ),
                                  TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Color.fromRGBO(34, 40, 49, 1),
                                          backgroundColor: Color.fromRGBO(253, 112, 19, 1),
                                          padding: const EdgeInsets.all(20.0),
                                          textStyle: const TextStyle(fontSize: 20),
                                        ),
                                        onPressed: () {
                                          opciones(context);
                                        },
                                        child: const Text('Cambiar Foto'),
                                      ),
                                ]
                              )
                              
                            ),
                          SizedBox(
                            height: 22,
                          ),
                          Container(
                            height: height * 0.40,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                double innerHeight = constraints.maxHeight;
                                double innerWidth = constraints.maxWidth;
                                return Container(
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
                                              "${Environment.usersession!.name} ${Environment.usersession!.lastName} ${Environment.usersession!.secondLastName}",
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
                                                      Environment.usersession!.allergies ==null? "Sin Alergias": Environment.usersession!.allergies!,
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
                                                      Environment.usersession!.bloodType ==null? "Sin Registrar": Environment.usersession!.bloodType!,
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
                                            Environment.usersession!.telephone!.toString(),
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
                                            Environment.usersession!.email!,
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
                                            "${Environment.usersession!.birthDate?.day}-${Environment.usersession!.birthDate?.month}-${Environment.usersession!.birthDate?.year}",
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
                                            Environment.usersession!.address.toString(),
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
                                                  onPressed: () {
                                                    ChangePassword();
                                                  },
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
                                                  onPressed: () {
                                                    Navigator.push(
                                                          context, MaterialPageRoute(builder: (context) => EditInfo(titleName:'Editar', personnelSend: Environment.usersession,)));
                                                  },
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
}
