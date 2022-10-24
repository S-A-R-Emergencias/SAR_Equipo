import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sar_equipo/screens/inventory.dart';
import 'package:provider/provider.dart';
import 'package:sar_equipo/src/login_logup/login.dart';
import 'package:sar_equipo/src/login_logup/logup.dart';
import 'package:sar_equipo/src/main_web_page.dart';
import 'package:sar_equipo/src/providers/person_provider.dart';
import 'package:sar_equipo/src/providers/personnel_provider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PersonProvider()),
      ],
      child: MaterialApp(
        title: 'Sar Emergencias',
        initialRoute: '/',
        routes: {
          '/': (_) => MainWebPage(),
          '/login': (context) => Login(titleName: 'Log In'),
          '/logup': (context) => Logup(titleName: 'Sign Up'),
        },
      ),
    );
  }
}
