import 'package:flutter/material.dart';
import 'package:sar_equipo/Models/person_model.dart';

import '../../Models/personnel_model.dart';
import '../services/personnel_service.dart';

class PersonnelProvider extends ChangeNotifier{
  List<Personnel> personnels = <Personnel>[];
  Future<List<Personnel>> getPersonnels() async {

    var service = PersonnelService();
    personnels = await service.getAll();
    notifyListeners();
    return personnels;

  }

  Future<List<Personnel>> refreshPersonnels() async {
    var service = PersonnelService();
    personnels = await service.getAll();
    notifyListeners();
    return personnels;
  }
}