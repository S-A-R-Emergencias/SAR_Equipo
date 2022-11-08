import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sar_equipo/screens/inventory.dart';
import 'package:provider/provider.dart';
import 'package:sar_equipo/Models/element_model.dart';
import 'package:sar_equipo/src/login_logup/login.dart';
import 'package:sar_equipo/src/main_web_page.dart';
import 'package:sar_equipo/src/pages/element_web_page.dart';
import 'package:sar_equipo/src/providers/element_provider.dart';
import 'package:sar_equipo/src/providers/elements_provider.dart';
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
        ChangeNotifierProvider(create: (_) => PersonnelProvider()),
        ChangeNotifierProvider(create: (_) => ElementProvider()),
      ],
      child: MaterialApp(
        title: 'Sar Emergencias',
        initialRoute: '/',
        routes: {
          '/': (_) => MainWebPage(),
          '/login': (_) => MainWebPage(),
          '/element': (_) => ElementPage()
          '/login': (context) => Login(titleName: 'Log In'),
          '/logup': (context) => Logup(titleName: 'Sign Up'),
        },
      ),
    );
  }
}
