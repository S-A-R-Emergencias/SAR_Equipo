import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sar_equipo/src/global/environment.dart';
import '../../Models/element_model.dart';

class ElementService {
  Future<List<Element_m>> getAll() async {
    final response = await http.get(Uri.parse('${Environment.apiURL}/element'));

    if (response.statusCode == 200 || response.statusCode == 304) {
      final decoded = await json.decode(response.body);
      var lst = <Element_m>[];
      for (var element in decoded) {
        Element_m ele = Element_m.fromJson(element);
        lst.add(ele);
      }
      return lst;
    }
    return [];
  }

  Future<Type> getOneElement(int id) async {
    final response =
        await http.get(Uri.parse('${Environment.apiURL}/element/${id}'));
    var ele = Element_m;
    if (response.statusCode == 200 || response.statusCode == 304) {
      final decoded = await json.decode(response.body);
      for (var element in decoded) {
        Element_m ele = Element_m.fromJson(element);
      }
      return ele;
    }
    return ele;
  }

  Future<dynamic> postElement(Element_m e) async {
    final response = await http.post(Uri.parse('${Environment.apiURL}/element'),
        body: json.encode(e.toInsertJson()),
        headers: <String,String>{'Content-Type':'application/json; charset=UTF-8' });
    return response;
  }

  Future<http.Response> putElement(Element_m e) async {
    final response = await http.patch(
        Uri.parse('${Environment.apiURL}/element/ ${e.id}'),
        body: json.encode(e.toJson()),
        headers: <String,String>{'Content-Type':'application/json; charset=UTF-8' });
    return response;
  }

  Future<http.Response> deleteElement(Element_m e) async {
    final response =
        await http.delete(Uri.parse('${Environment.apiURL}/element/${e.id}'));
    return response;
  }
}
