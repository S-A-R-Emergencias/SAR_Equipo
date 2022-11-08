// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Email {
  final String image, name, subject, body, time;
  final bool isAttachmentAvailable, isChecked;
  final Color tagColor;

  Email(
      {required this.name,
      required this.image,
      required this.subject,
      required this.isAttachmentAvailable,
      required this.isChecked,
      required this.tagColor,
      required this.time,
      required this.body});
}

List<Email> emails = List.generate(
  demo_data.length,
  (index) => Email(
    name: demo_data[index]['name'],
    image: demo_data[index]['image'],
    subject: demo_data[index]['subject'],
    isAttachmentAvailable: demo_data[index]['isAttachmentAvailable'],
    isChecked: demo_data[index]['isChecked'],
    tagColor: demo_data[index]['tagColor'],
    time: demo_data[index]['time'],
    body: emailDemoText,
  ),
);

// ignore: non_constant_identifier_names
List demo_data = [
  {
    "name": "Jhonn Aguilar",
    "image": "assets/images/user_4.png",
    "subject": "Incendio",
    "isAttachmentAvailable": false,
    "isChecked": true,
    "tagColor": Color.fromARGB(255, 221, 0, 0),
    "time": "Now"
  },
  {
    "name": "Marta Diaz",
    "image": "assets/images/user_2.png",
    "subject": "Persona atrapada",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "tagColor": Color.fromARGB(255, 81, 84, 83),
    "time": "15:32"
  },
  {
    "name": "Marvin Rosa",
    "image": "assets/images/user_3.png",
    "subject": "Accidente de Coche",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "tagColor": Color.fromARGB(255, 81, 84, 83),
    "time": "14:27",
  },
  {
    "name": "Damian Diaz",
    "image": "assets/images/user_4.png",
    "subject": "Incendio",
    "isAttachmentAvailable": false,
    "isChecked": true,
    "tagColor": Color.fromARGB(255, 221, 0, 0),
    "time": "10:43"
  },
  {
    "name": "Elena Castillo",
    "image": "assets/images/user_5.png",
    "subject": "Terremoto",
    "isAttachmentAvailable": false,
    "isChecked": false,
    "tagColor": Color.fromARGB(255, 81, 84, 83),
    "time": "9:58"
  }
];

String emailDemoText =
    "Auxilio!!, Necesito su ayuda de inmediato tenemos una emergencia. Mi casa esta en llamas debido a una fuga de gas, Aun hay gente dentro del lugar, no se su estado pero lleguen lo antes posible";
