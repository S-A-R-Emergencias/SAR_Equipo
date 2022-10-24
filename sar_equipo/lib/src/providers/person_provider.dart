import 'package:flutter/material.dart';
import 'package:sar_equipo/Models/person_model.dart';
import '../services/person_service.dart';

class PersonProvider extends ChangeNotifier{
  List<Person>? persons;
  Future<List<Person>?> getPersons() async {
    if(persons != null){
      return persons;
    }
    var service = PersonService();
    persons = await service.getAll();
    notifyListeners();
    return persons;
  }

  Future<List<Person>?> refreshPersons() async {
    var service = PersonService();
    persons = await service.getAll();
    notifyListeners();
    return persons;
  }
}