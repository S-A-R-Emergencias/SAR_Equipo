import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Models/element_model.dart';
import 'src/product/UpdateProduct.dart';
import 'package:sar_equipo/Models/element_model.dart';
import 'package:sar_equipo/src/login_logup/login.dart';
import 'package:sar_equipo/src/login_logup/logup.dart';
import 'package:sar_equipo/src/main_web_page.dart';
import 'package:sar_equipo/src/notification_view/screens/main/main_screen.dart';
import 'package:sar_equipo/src/product/InsertProduct.dart';
import 'package:sar_equipo/src/pages/element_web_page.dart';
import 'package:sar_equipo/src/providers/element_provider.dart';
import 'package:sar_equipo/src/providers/person_provider.dart';
import 'package:sar_equipo/src/providers/personnel_provider.dart';
import 'package:sar_equipo/src/notification_view/models/Email.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDxLKJAnexCSkPZmfuvV2gvHVsq6qH6dEU",
          authDomain: "emergencias-sar.firebaseapp.com",
          databaseURL: "https://emergencias-sar-default-rtdb.firebaseio.com",
          projectId: "emergencias-sar",
          storageBucket: "emergencias-sar.appspot.com",
          messagingSenderId: "47517749067",
          appId: "1:47517749067:web:f47bc2d3588c44a3d6a2ce",
          measurementId: "G-SG9JVRT773"));
  getNotifications();

void getNotifications() async {
  myNotifications.clear();
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("notification");

  QuerySnapshot notifications = await collectionReference.get();

  for (var notification in notifications.docs) {
    Color col = Color.fromARGB(0, 0, 0, 0);
    switch (notification.get("normal_Panic")) {
      case 0:
        col = Color.fromARGB(255, 255, 0, 0);
        break;
      case 1:
        col = Color.fromARGB(255, 39, 54, 115);
        break;
      case 2:
        col = Color.fromARGB(0, 0, 0, 0);
        break;
    }
    myNotifications.add(Email(
        id: notification.id,
        name: notification.get("name").toString(),
        image: notification.get("image").toString(),
        type: notification.get("type"),
        normalPanicAnonymous: notification.get("normal_Panic"),
        tagColor: col,
        isChecked: notification.get("isChecked"),
        time: notification.get("time"),
        body: notification.get("body").toString(),
        latitude: notification.get("latitude"),
        longitude: notification.get("longitude"),
        mail: notification.get("mail")));
  }
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

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
          //'/': (_) => MainScreen(emailDefault: emails[0]),
          '/': (_) => Login(titleName: 'Log In'),
          '/element': (_) => ElementPage(),
          '/login': (context) => Login(titleName: 'Log In'),
          '/logup': (context) => Logup(titleName: 'Sign Up'),
          '/elementInsert': (context) => InsertProduct(),
          '/elementUpdate':(context)=> UpdateProduct(new Element_m()),
          
        },
      ),
    );
  }
}

