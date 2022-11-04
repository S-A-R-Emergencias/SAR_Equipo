import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth101/login_signup/home_screen.dart';
import 'package:firebase_auth101/login_signup/signup_screen.dart';
import 'package:firebase_auth101/login_signup/widgets/customized_textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'services/firebase_auth_service.dart';
import 'widgets/customized_button.dart';
import 'forgot_passwor.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 123, 0),
          body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 35,
                  width: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
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
                child: Text("Inicio de secion",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(
              height: 90,
              width: 90,
              child: Image(
                image: AssetImage("assets/logooo.png"), fit: BoxFit.cover),
            ),
              CustomizedTextfield(
                myController: _emailController,
                hintText: "Ingrese su  Email",
                isPassword: false,
              ),
              CustomizedTextfield(
                myController: _passwordController,
                hintText: "Ingrese su contraseña",
                isPassword: true,
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
                              builder: (context) => const ForgotPassword()));
                    },
                    child: const Text("Actualizar contraseña?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                        )),
                  ),
                ),
              ),
              
              CustomizedButton(
                buttonText: "Ingresar",
                buttonColor: Colors.black,
                textColor: Colors.white,
                onPressed: () async {
            
                  try {
                    await FirebaseAuthService().login(
                        _emailController.text.trim(),
                        _passwordController.text.trim());
                    if (FirebaseAuth.instance.currentUser != null) {
                      if (!mounted) return;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    }

                 
                  } on FirebaseException catch (e) {
                    debugPrint("error is ${e.message}");

                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                                title: const Text(
                                    " Email o contraseña incorrector porfavor ingrese datos correctos"),
                                actions: [
                                  ElevatedButton(
                                    child: const Text("Registararse ahora"),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignUpScreen()));
                                    },
                                  )
                                ]));
                  }                
                },
              ),
                  CustomizedButton(
              buttonText: "Registro",
              buttonColor: Color.fromARGB(255, 0, 0, 0),
              textColor: Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SignUpScreen()));
              },
            ),
            ],
          ),
        ),
      )),
    );
  }
}
