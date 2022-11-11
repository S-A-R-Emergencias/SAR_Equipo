// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sar_equipo/main.dart';

class Email {
  String id, image, name, type, body, time, mail;
  bool normalPanic, isChecked;
  Color tagColor;
  double latitude, longitude;

  Email(
      {required this.id,
      required this.name,
      required this.image,
      required this.type,
      required this.normalPanic,
      required this.tagColor,
      required this.isChecked,
      required this.time,
      required this.body,
      required this.latitude,
      required this.longitude,
      required this.mail});
}

List<Email> myNotifications = [];

List<Email> sessionNotif = [];

Email actual = emails[0];

int filter = 2;

int todasN = 0;
int emergenciasN = 0;
int reportesN = 0;
int atendidosN = 0;

bool todas = true;
bool emergencias = false;
bool reportes = false;
bool atendidos = false;

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
      latitude: 15.56,
      longitude: 12,
      mail: ""),
);

// // ignore: non_constant_identifier_names
List demo_data = [
  {
    "name": "",
    "image": "assets/images/anonimo.png",
    "type": "",
    "normal_Panic": false,
    "isChecked": false,
    "tagColor": Color.fromARGB(255, 221, 0, 0),
    "time": ""
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

String emailDemoText = "";
