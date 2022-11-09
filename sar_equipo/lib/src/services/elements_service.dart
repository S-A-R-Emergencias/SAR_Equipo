import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sar_equipo/src/global/environment.dart';

import '../../Models/element_model.dart';

class ElementService {
  Future<List<Element_m>> getAll() async {
    final response =
        await http.get(Uri.parse('${Environment.apiURL}/elements'));
    if (response.statusCode == 200) {
      final decoded = await json.decode(response.body);
      var lst = <Element_m>[];
      for (var element in decoded) {
        var el = new Element_m.fromJson(element);
        lst.add(el);
      }
      return lst;
    }
    return [];
  }
}
