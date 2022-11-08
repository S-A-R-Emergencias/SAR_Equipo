import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth101/src/global/environment.dart';
import '../../Models/element_type_model.dart';

class ElementTypeService{
  Future<List<ElementType>> getAll() async {
    final response =  await http.get(Uri.parse('${Environment.apiURL}/elementtype'));
    
    if(response.statusCode == 200 || response.statusCode == 304){
      final decoded = await json.decode(response.body);
      var lst = <ElementType>[];
      for(var eventtype in decoded){
        ElementType elementT =  ElementType.fromJson(eventtype);
        lst.add(elementT);
      }
      return lst;
    }
    return [];
  }

  Future<Type> getElementype(int id) async {
    final response =  await http.get(Uri.parse('${Environment.apiURL}/elementtype/${id}'));
    var elementT = ElementType;
    if(response.statusCode == 200 || response.statusCode == 304){
      final decoded = await json.decode(response.body);
      for(var elementtype in decoded){
        ElementType elementT =  ElementType.fromJson(elementtype);
      }
      return elementT;
    }
    return elementT;
  }

  Future<http.Response> postElementype(ElementType et) async {
    final response =  await http.post(Uri.parse('${Environment.apiURL}/elementtype'), body: et.toInsertJson());
    return response;
  }

  Future<http.Response> putElementype(ElementType et) async {
    final response =  await http.patch(Uri.parse('${Environment.apiURL}/elementtype/ ${et.id}'), body: et.toJson());
    return response; 
  }

  Future<http.Response> deleteElementype(ElementType et) async {
    final response =  await http.delete(Uri.parse('${Environment.apiURL}/elementtype/ ${et.id}'));
    return response;
  }
}