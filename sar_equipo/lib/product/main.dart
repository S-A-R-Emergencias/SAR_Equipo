import 'package:flutter/material.dart';
import 'image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Register products',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textSelectionTheme: TextSelectionThemeData(
        ),
      ),
      home: Imagen(),
    );
  }
}
