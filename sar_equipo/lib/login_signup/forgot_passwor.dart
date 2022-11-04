import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth101/login_signup/login_screen.dart';
import 'package:firebase_auth101/login_signup/widgets/customized_button.dart';
import 'package:flutter/material.dart';

import 'widgets/customized_textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 102, 0),
      body: SizedBox (
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                width: 50,
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
               const SizedBox(
              height: 90,
              width: 90,
              child: Image(
                image: AssetImage("assets/logooo.png"), fit: BoxFit.cover),
            ),
            const Padding(
              
              padding: EdgeInsets.all(20.0),
              child: Text("Has olvidado tu contraseña?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text(
                  "No te preocupes, se nos ocurre a todos. Le enviaremos un enlace para restablecer su contraseña..",
                  style: TextStyle(
                    color: Color.fromARGB(255, 23, 23, 24),
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  )),
            ),
            CustomizedTextfield(
              myController: _emailController,
              hintText: "Ingrese su Email :",
              isPassword: false,
            ),
            CustomizedButton(
              buttonText: "Enviar codigo",
              buttonColor: Colors.black,
              textColor: Colors.white,
              onPressed: () {
               
              auth.sendPasswordResetEmail(email: _emailController.text);
                  Navigator.of(context).pop();

                  showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        content: Text ('Dirigite a tu cuenta de Gmail(Google)en espan'),
                      );
                    }
                  );
              },
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
    ));
  }
}
