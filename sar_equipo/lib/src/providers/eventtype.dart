import 'package:flutter/material.dart';
import 'package:firebase_auth101/Models/event_type_model.dart';
import '../services/eventtype_service.dart';

class EventTypeProvider extends ChangeNotifier{
  List<EventType>? elementtypes;
  Future<List<EventType>?> getElementTypes() async {
    if(elementtypes != null){
      return elementtypes;
    }
    var service = EventTypeService();
    elementtypes = await service.getAll();
    notifyListeners();
    return elementtypes;
  }

  Future<List<EventType>?> refreshPersons() async {
    var service = EventTypeService();
    elementtypes = await service.getAll();
    notifyListeners();
    return elementtypes;
    
  }
}