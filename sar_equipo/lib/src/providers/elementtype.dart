import 'package:flutter/material.dart';
import 'package:sar_equipo/Models/element_type_model.dart';
import '../services/elementtype_service.dart';
import '../services/person_service.dart';

class ElementTypeProvider extends ChangeNotifier{
  List<ElementType>? ElementTypes;
  Future<List<ElementType>?> getElementTypes() async {
    if(ElementTypes != null){
      return ElementTypes;
    }
    var service = ElementTypeService();
    ElementTypes = await service.getAll();
    notifyListeners();
    return ElementTypes;
  }

  Future<List<ElementType>?> refreshPersons() async {
    var service = ElementTypeService();
    ElementTypes = await service.getAll();
    notifyListeners();
    return ElementTypes;
  }
}