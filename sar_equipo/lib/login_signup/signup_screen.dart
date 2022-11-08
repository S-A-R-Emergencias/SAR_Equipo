<<<<<<< Updated upstream
import 'package:firebase_auth101/login_signup/services/firebase_auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/customized_button.dart';
import 'widgets/customized_textfield.dart';
import 'login_screen.dart';
=======
import 'dart:html';

import 'package:firebase_auth101/Models/person_model.dart';
import 'package:firebase_auth101/login_signup/home_screen.dart';
import 'package:firebase_auth101/login_signup/services/firebase_auth_service.dart';
import 'package:firebase_auth101/src/services/element.service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth101/Models/element_model.dart';
import 'package:firebase_auth101/Models/element_model.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth101/src/services/element.service.dart';
import 'widgets/customized_button.dart';
import 'widgets/customized_textfield.dart';
import 'login_screen.dart';
import 'upDatos.dart';
import 'package:firebase_auth101/constans.dart';
import 'package:firebase_auth101/src/services/personnel_service.dart';


final elevatedButtonStyle = ElevatedButton.styleFrom(
  shadowColor: Color.fromARGB(255, 52, 55, 66),
  backgroundColor: Color.fromARGB(255, 52, 55, 66),
  foregroundColor: Colors.white,
  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  elevation: 10.0,
);
>>>>>>> Stashed changes

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
<<<<<<< Updated upstream
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _sexoController = TextEditingController();
  final TextEditingController _nacimientoController = TextEditingController();
  final TextEditingController _carnetController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
                  backgroundColor: Color.fromARGB(255, 255, 115, 0),

          body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_sharp),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ),
              Center(
              child: Text("Registro"),
              ),             
              CustomizedTextfield(
                myController: _usernameController,
                hintText: "Nombre completo",
                isPassword: false,  
              ),  CustomizedTextfield(
                myController: _sexoController,
                hintText: "Sexo",
                isPassword: false,
              ),
                CustomizedTextfield(
                myController: _nacimientoController,
                hintText: "FechaNacimiento",
                isPassword: false,
              ),
                CustomizedTextfield(
                myController: _carnetController,
                hintText: "Carnet",
                isPassword: false,
              ),
              CustomizedTextfield(
                myController: _emailController,
                hintText: "Email",
                isPassword: false,
              ),
              CustomizedTextfield(
                myController: _passwordController,
                hintText: "Contraseña",
                isPassword: true,
              ),

=======
  
   TextEditingController _emailController = TextEditingController();
   TextEditingController _usernameController = TextEditingController();
   TextEditingController _lastName = TextEditingController();
   TextEditingController _secondLastName = TextEditingController();
   TextEditingController _carnetController = TextEditingController();
   TextEditingController _addres = TextEditingController();
   TextEditingController _birthDate = TextEditingController();
   TextEditingController _telephone = TextEditingController();
   TextEditingController _passwordController = TextEditingController();
   TextEditingController _role = TextEditingController();


    Future<void> insertElement() async{
      try{
          Person persons = new Person(
            email: _emailController.text, 
            name: _usernameController.text, 
            lastName: _lastName.text, 
            secondLastName:_secondLastName.text, 
            ci: int.parse(_carnetController.text), 
            address: _addres.text,
            birthDate: DateTime.parse(_birthDate.text), 
            telephone:int.parse(_telephone.text), 
            password: _passwordController.text, 
            role: _role.text);
                          
       ElementService service = new ElementService();

        Navigator.pushNamed(context, '/');
      
      }catch(e){
        _usernameController.text ="error";
      }    
    }
  final formKey = GlobalKey<FormState>(); //key for form
  String name="";
  @override
  Widget build(BuildContext context)
  {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double _height_container = _height * 0.9;
    double _width_container = _width * 0.9;
    double espacio = 15.0;

    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromARGB(255, 143, 77, 16),
      child: Center(
        child: Container(
          width: (_width_container),
          height: (_height_container),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(40),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: _height * 0.63,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'CREAR CUENTA S.A.R.',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),

              CustomizedTextfield(
                myController: _emailController,
                hintText: "Email:",
                isPassword: false,               
              ),

              CustomizedTextfield(
                myController: _usernameController,
                hintText: "Nombre:",
                isPassword: false,               
              ),
              
              CustomizedTextfield(
                myController: _lastName,
                hintText: "Primer Apellido:",
                isPassword: false,               
              ),

              CustomizedTextfield(
                myController: _secondLastName,
                hintText: "Segundo Apellido:",
                isPassword: false,               
              ),

              CustomizedTextfield(
                myController: _carnetController,
                hintText: "Carnet:",
                isPassword: false,               
              ),
>>>>>>> Stashed changes
              CustomizedButton(
                buttonText: "Registrar",
                buttonColor: Color.fromARGB(255, 0, 0, 0),
                textColor: Colors.white,
                onPressed: () async {
<<<<<<< Updated upstream
=======
                                    showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        content: Text ('llene todos los campos solicitados'),
                      );
                    }
                  );
>>>>>>> Stashed changes
                  try {
                    await FirebaseAuthService().signup(
                        _emailController.text.trim(),
                        _passwordController.text.trim());

                    if (!mounted) return;

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()));
                  } on FirebaseException catch (e) {
                    debugPrint(e.message);
                  }

                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (_) => const LoginScreen()));
                },
<<<<<<< Updated upstream
              ),          
            ],
          ),
        ),
      )),
    );
=======
              ), 
                
                    
                    SizedBox(
                      height: espacio + 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SizedBox(
                          width: 60,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //Columna 2
              Container(
                width: _height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: espacio + 100,
                    ),

                    
              CustomizedTextfield(
                myController: _addres,
                hintText: "Fecha Nacimiento:",
                isPassword: false,               
              ),

              CustomizedTextfield(
                myController: _telephone,
                hintText: "Telefono:",
                isPassword: false,               
              ),

              CustomizedTextfield(
                myController: _passwordController,
                hintText: "Contraseña:",
                isPassword: false,               
              ),

              CustomizedTextfield(
                myController: _role,
                hintText: "Rol:",
                isPassword: false,               
              ),


                Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: const Text("Actualizar datos preciona aqui?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                        )),
                  ),
                ),
              ),




            ],
          ),
        ),
              Container(
                  width: _width_container * 0.3,
                  height: _height,
                  // color: Colors.red,
                  child: (Center(
                    child: Image.asset(
                      "assets/fondo.jpg",
                      height: _height,
                      width: _width_container * 0.3,
                      fit: BoxFit.cover,
                    ),
                 )
               )
             ),
            ],
          ),
        ),
      ),
    ));
>>>>>>> Stashed changes
  }
}
