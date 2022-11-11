import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sar_equipo/screens/inventory.dart';
import 'package:provider/provider.dart';
import 'package:sar_equipo/src/login_logup/login.dart';
import 'package:sar_equipo/src/login_logup/logup.dart';
import 'package:sar_equipo/src/main_web_page.dart';
import 'package:sar_equipo/src/notification_view/screens/main/main_screen.dart';
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
  runApp(MainApp());
}

void getNotifications() async {
  myNotifications.clear();
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("notification");

  QuerySnapshot notifications = await collectionReference.get();

  for (var notification in notifications.docs) {
    Color col;
    if (notification.get("normal_Panic")) {
      col = Color.fromARGB(255, 255, 0, 0);
    } else {
      col = Color.fromARGB(255, 39, 54, 115);
    }
    myNotifications.add(Email(
        id: notification.id,
        name: notification.get("name").toString(),
        image: notification.get("image").toString(),
        type: notification.get("type"),
        normalPanic: notification.get("normal_Panic"),
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
      ],
      child: MaterialApp(
        title: 'Sar Emergencias',
        initialRoute: '/',
        routes: {
          '/': (_) => MainScreen(emailDefault: emails[0]),
          '/login': (context) => Login(titleName: 'Log In'),
          '/logup': (context) => Logup(titleName: 'Sign Up'),
        },
      ),
    );
  }
}
