// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sar_equipo/main.dart';

class Email {
  String id, image, name, type, body, time, mail;
  bool isChecked;
  Color tagColor;
  double latitude, longitude;
  int normalPanicAnonymous;

  Email(
      {required this.id,
      required this.name,
      required this.image,
      required this.type,
      required this.normalPanicAnonymous,
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

int filter = 1;

int todasN = 0;
int emergenciasN = 0;
int reportesN = 0;
int atendidosN = 0;
int anonimosN = 0;

bool todas = true;
bool emergencias = false;
bool reportes = false;
bool atendidos = false;
bool anonimos = false;

List<Email> emails = List.generate(
  demo_data.length,
  (index) => Email(
      id: "",
      name: demo_data[index]['name'],
      image: demo_data[index]['image'],
      type: demo_data[index]['type'],
      normalPanicAnonymous: demo_data[index]['normal_Panic'],
      isChecked: demo_data[index]['isChecked'],
      tagColor: demo_data[index]['tagColor'],
      time: demo_data[index]['time'],
      body: emailDemoText,
      latitude: 0,
      longitude: 0,
      mail: ""),
);

// // ignore: non_constant_identifier_names
List demo_data = [
  {
    "name": "",
    "image": "assets/images/anonimo.png",
    "type": "",
    "normal_Panic": 2,
    "isChecked": false,
    "tagColor": Color.fromARGB(255, 221, 0, 0),
    "time": ""
  }
];

String emailDemoText = "";
