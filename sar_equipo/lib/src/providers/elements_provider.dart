import 'package:flutter/material.dart';
import 'package:sar_equipo/Models/element_model.dart';

import '../services/element_service.dart';

class ElementsProvider extends ChangeNotifier {
  List<Element_m>? elements;
  Future<List<Element_m>?> getElements() async {
    if (elements != null) {
      return elements;
    }
    var service = ElementService();
    elements = await service.getAll();
    notifyListeners();
    return elements;
  }

  Future<List<Element_m>?> refreshElements() async {
    var service = ElementService();
    elements = await service.getAll();
    notifyListeners();
    return elements;
  }
}
