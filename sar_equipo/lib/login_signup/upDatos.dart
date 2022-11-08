import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth101/login_signup/welcome_screen.dart';
import 'dart:html';
import 'package:firebase_auth101/Models/person_model.dart';
import 'package:firebase_auth101/login_signup/services/firebase_auth_service.dart';
import 'package:firebase_auth101/src/services/element.service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth101/Models/element_model.dart';
import 'package:flutter/services.dart';
import 'widgets/customized_button.dart';
import 'widgets/customized_textfield.dart';
import 'login_screen.dart';
import 'package:firebase_auth101/constans.dart';
import 'package:firebase_auth101/src/services/personnel_service.dart';
import 'upDatos.dart';
import 'signup_screen.dart';

final elevatedButtonStyle = ElevatedButton.styleFrom(
  shadowColor: Color.fromARGB(255, 52, 55, 66),
  backgroundColor: Color.fromARGB(255, 52, 55, 66),
  foregroundColor: Colors.white,
  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  elevation: 10.0,
);

class UpScreen extends StatefulWidget {

  @override
  
    _UpScreenState createState() => _UpScreenState ();

 Person actualizar;
 UpScreen(this.actualizar);
}
class _UpScreenState extends State<UpScreen>{

    ElementService service = new ElementService();

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


              Navigator.pushNamed(context, '/');

      }catch(e){
        _usernameController.text = e.toString();
      } 
    } 
      int? data;

  final formKey = GlobalKey<FormState>(); //key for form                 
  @override
  Widget build(BuildContext context){
    _usernameController.text= widget.actualizar.name.toString();
    _telephone.text= widget.actualizar.telephone.toString();
    _secondLastName.text= widget.actualizar.secondLastName.toString();
    _role.text= widget.actualizar.role.toString();
    _passwordController.text= widget.actualizar.password.toString();
    _lastName.text= widget.actualizar.lastName.toString();
    _emailController.text= widget.actualizar.email.toString();
    _carnetController.text= widget.actualizar.ci.toString();
    _addres.text= widget.actualizar.address.toString();
    double espacio =30.00;
 
    final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double _height_container = _height * 0.9;
    double _width_container = _width * 0.9;

    return Scaffold(
      key: _scaffoldKey,

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
              CustomizedButton(
                buttonText: "Registrar",
                buttonColor: Color.fromARGB(255, 0, 0, 0),
                textColor: Colors.white,
                onPressed: () async {
                                    showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        content: Text ('llene todos los campos solicitados'),
                      );
                    }
                  );
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
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text("Recurdas la contraseña preciona aqui?",
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
    )


    );
  }
 }
