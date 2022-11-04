// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sar_equipo/main.dart';

class Email {
  String id, image, name, type, body, time;
  bool normalPanic, isChecked;
  Color tagColor;

  Email(
      {required this.id,
      required this.name,
      required this.image,
      required this.type,
      required this.normalPanic,
      required this.tagColor,
      required this.isChecked,
      required this.time,
      required this.body});
}

List<Email> myNotifications = [];

List<Email> sessionNotif = [];

List<Email> emails = List.generate(
  demo_data.length,
  (index) => Email(
    id: "rgdfg454",
    name: demo_data[index]['name'],
    image: demo_data[index]['image'],
    type: demo_data[index]['type'],
    normalPanic: demo_data[index]['normal_Panic'],
    isChecked: demo_data[index]['isChecked'],
    tagColor: demo_data[index]['tagColor'],
    time: demo_data[index]['time'],
    body: emailDemoText,
  ),
);

// // ignore: non_constant_identifier_names
List demo_data = [
  {
    "name": "Jhonn Aguilar",
    "image": "assets/images/user_4.png",
    "type": "Incendio",
    "normal_Panic": false,
    "isChecked": true,
    "tagColor": Color.fromARGB(255, 221, 0, 0),
    "time": "Now"
  },
  {
    "name": "Marta Diaz",
    "image": "assets/images/user_2.png",
    "type": "Persona atrapada",
    "normal_Panic": true,
    "isChecked": false,
    "tagColor": Color.fromARGB(255, 81, 84, 83),
    "time": "15:32"
  },
  {
    "name": "Marvin Rosa",
    "image": "assets/images/user_3.png",
    "type": "Accidente de Coche",
    "normal_Panic": true,
    "isChecked": false,
    "tagColor": Color.fromARGB(255, 81, 84, 83),
    "time": "14:27",
  },
  {
    "name": "Damian Diaz",
    "image": "assets/images/user_4.png",
    "type": "Incendio",
    "normal_Panic": false,
    "isChecked": true,
    "tagColor": Color.fromARGB(255, 221, 0, 0),
    "time": "10:43"
  },
  {
    "name": "Elena Castillo",
    "image": "assets/images/user_5.png",
    "type": "Terremoto",
    "normal_Panic": false,
    "isChecked": false,
    "tagColor": Color.fromARGB(255, 81, 84, 83),
    "time": "9:58"
  }
];

String emailDemoText =
    "Auxilio!!, Necesito su ayuda de inmediato tenemos una emergencia. Mi casa esta en llamas debido a una fuga de gas, Aun hay gente dentro del lugar, no se su estado pero lleguen lo antes posible";
