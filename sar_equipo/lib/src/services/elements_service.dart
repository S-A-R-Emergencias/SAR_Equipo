import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sar_equipo/src/global/environment.dart';

import '../../Models/element_model.dart';

class ElementService {
  Future<List<ElementItem>> getAll() async {
    final response =
        await http.get(Uri.parse('${Environment.apiURL}/elements'));
    if (response.statusCode == 200) {
      final decoded = await json.decode(response.body);
      var lst = <ElementItem>[];
      for (var element in decoded) {
        var el = new ElementItem.fromJson(element);
        lst.add(el);
      }
      return lst;
    }
    return [];
  }
}
