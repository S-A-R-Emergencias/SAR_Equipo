import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sar_equipo/src/global/environment.dart';
import '../../Models/accident_report_model.dart';
import 'package:http/http.dart' as http;

class AccidentService{
  Future<List<AccidentReport>> getAll() async {
    final response =  await http.get(Uri.parse('${Environment.apiURL}/accident'));
    
    if(response.statusCode == 200 || response.statusCode == 304){
      final decoded = await json.decode(response.body);
      var lst = <AccidentReport>[];
      for(var accident in decoded){
        AccidentReport acc =  AccidentReport.fromJson(accident);
        lst.add(acc);
      }
      return lst;
    }
    return [];
  }

  Future<Type> getOneAccident(int id) async {
    final response =  await http.get(Uri.parse('${Environment.apiURL}/accident/${id}'));
    var acc = AccidentReport;
    if(response.statusCode == 200 || response.statusCode == 304){
      final decoded = await json.decode(response.body);
      for(var accident in decoded){
        AccidentReport acc =  AccidentReport.fromJson(accident);
      }
      return acc;
    }
    return acc;
  }

  Future<http.Response> postAccident(AccidentReport a) async {
    final response =  await http.post(Uri.parse('${Environment.apiURL}/accident'), body: a.toInsertJson());
    return response;
  }

  Future<http.Response> putAccident(AccidentReport a) async {
    final response =  await http.patch(Uri.parse('${Environment.apiURL}/accident/ ${a.id}'), body: a.toJson());
    return response;
  }

  Future<http.Response> deleteAccident(AccidentReport a) async {
    final response =  await http.delete(Uri.parse('${Environment.apiURL}/accident/ ${a.id}'));
    return response;
  }
}