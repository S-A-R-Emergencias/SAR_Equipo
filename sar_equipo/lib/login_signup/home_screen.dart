import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth101/login_signup/welcome_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String? userName = FirebaseAuth.instance.currentUser?.displayName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 123, 0),
        title: const Text(" Inicio sar"),
      ),
      body: Column(
        children: [
          Text("Hello $userName"),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (!mounted) return;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const WelcomeScreen();
                }));
              },
              child: const Text("Cerrar secion"))
        ],
      ),
    );
  }
}
