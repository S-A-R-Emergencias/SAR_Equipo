import 'package:sar_equipo/Model/user_model.dart';

class Personel extends User{
  String grade;
  String bloodType;
  String allergies;
  Personel({required super.name, 
    required super.lastName,
    required super.secondLastName, 
    required super.address, 
    required super.birthDate, 
    required super.email, 
    required super.telephone,
    required this.allergies,
    required this.bloodType,
    required this.grade
   });

}