import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sar_equipo/src/global/environment.dart';
import '../../Models/element_model.dart';

class ElementService {
  Future<List<ElementItem>> getAll() async {
    final response = await http.get(Uri.parse('${Environment.apiURL}/element'));

    if (response.statusCode == 200 || response.statusCode == 304) {
      final decoded = await json.decode(response.body);
      var lst = <ElementItem>[];
      for (var element in decoded) {
        ElementItem ele = ElementItem.fromJson(element);
        lst.add(ele);
      }
      return lst;
    }
    return [];
  }

  Future<Type> getOneElement(int id) async {
    final response =
        await http.get(Uri.parse('${Environment.apiURL}/element/${id}'));
    var ele = ElementItem;
    if (response.statusCode == 200 || response.statusCode == 304) {
      final decoded = await json.decode(response.body);
      for (var element in decoded) {
        ElementItem ele = ElementItem.fromJson(element);
      }
      return ele;
    }
    return ele;
  }

  Future<http.Response> postElement(ElementItem e) async {
    final response = await http.post(Uri.parse('${Environment.apiURL}/element'),
        body: e.toInsertJson());
    return response;
  }

  Future<http.Response> putElement(ElementItem e) async {
    final response = await http.patch(
        Uri.parse('${Environment.apiURL}/element/ ${e.id}'),
        body: e.toJson());
    return response;
  }

  Future<http.Response> deleteElement(ElementItem e) async {
    final response =
        await http.delete(Uri.parse('${Environment.apiURL}/element/ ${e.id}'));
    return response;
  }
}
