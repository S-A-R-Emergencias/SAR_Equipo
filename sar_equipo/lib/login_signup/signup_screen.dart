import 'package:firebase_auth101/login_signup/services/firebase_auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/customized_button.dart';
import 'widgets/customized_textfield.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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

              CustomizedButton(
                buttonText: "Registrar",
                buttonColor: Color.fromARGB(255, 0, 0, 0),
                textColor: Colors.white,
                onPressed: () async {
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
            ],
          ),
        ),
      )),
    );
  }
}
