import 'package:flutter/material.dart';
import 'package:firebase_auth101/Models/accident_report_model.dart';
import 'package:firebase_auth101/Models/accident_report_model.dart';
import '../services/accident_report.service.dart';

class AccidentProvider extends ChangeNotifier{
  List<AccidentReport>? accidents;
  Future<List<AccidentReport>?> getAccidents() async {
    if(accidents != null){
      return accidents;
    }
    
    var service = AccidentService();
    accidents = await service.getAll();
    notifyListeners();
    return accidents;
  }

  Future<List<AccidentReport>?> refreshAccidents() async {
    var service = AccidentService();
    accidents = await service.getAll();
    notifyListeners();
    return accidents;
  }
}