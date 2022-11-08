import 'package:flutter/material.dart';
import 'package:firebase_auth101/Models/personnel_model.dart';
import '../services/personnel_service.dart';

class PersonnelProvider extends ChangeNotifier {
  List<Personnel>? personnels;
  Future<List<Personnel>?> getPersonnels() async {
    if (personnels != null) {
      return personnels;
    }
    var service = PersonnelService();
    personnels = await service.getAll();
    notifyListeners();
    return personnels;
  }

  Future<List<Personnel>?> refreshPersonnels() async {
    var service = PersonnelService();
    personnels = await service.getAll();
    notifyListeners();
    return personnels;
  }
}
