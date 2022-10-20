import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sar_equipo/src/global/environment.dart';
import '../../Models/person_model.dart';

class PersonService{
  Future<List<Person>> getAll() async {
    final response =  await http.get(Uri.parse('${Environment.apiURL}/person'));
    
    if(response.statusCode == 200 || response.statusCode == 304){
      final decoded = await json.decode(response.body);
      var lst = <Person>[];
      for(var person in decoded){
        Person per =  Person.fromJson(person);
        lst.add(per);
      }
      return lst;
    }
    return [];
  }

  Future<Type> getOnePerson(int id) async {
    final response =  await http.get(Uri.parse('${Environment.apiURL}/person/${id}'));
    var per = Person;
    if(response.statusCode == 200 || response.statusCode == 304){
      final decoded = await json.decode(response.body);
      for(var person in decoded){
        Person per =  Person.fromJson(person);
      }
      return per;
    }
    return per;
  }

  Future<http.Response> postPerson(Person p) async {
    final response =  await http.post(Uri.parse('${Environment.apiURL}/person'), body: p.toInsertJson());
    return response;
  }

  Future<http.Response> putPerson(Person p) async {
    final response =  await http.patch(Uri.parse('${Environment.apiURL}/person/ ${p.id}'), body: p.toJson());
    return response;
  }

  Future<http.Response> deletePerson(Person p) async {
    final response =  await http.delete(Uri.parse('${Environment.apiURL}/person/ ${p.id}'));
    return response;
  }
}