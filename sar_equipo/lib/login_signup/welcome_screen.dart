import 'package:firebase_auth101/login_signup/login_screen.dart';
import 'package:firebase_auth101/login_signup/signup_screen.dart';
import 'package:firebase_auth101/login_signup/widgets/customized_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 158, 47, 3),
      
      body: Container(
        
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/fon.jpg"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
               const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Bienvenido",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(
              height: 180,
              width: 180,
              child: Image(
                image: AssetImage("assets/logooo.png"), fit: BoxFit.cover),
            ),
            const SizedBox(height: 30),
            
            CustomizedButton(
              buttonText: "Acceso",
              buttonColor: Colors.black,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
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
            const SizedBox(height: 20),
           const Padding(
              padding:  EdgeInsets.all(10.0),
              child: Text(
                "Sar Bolivia © 2022. Solutions SRL",
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
