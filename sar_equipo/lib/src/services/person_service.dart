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
}