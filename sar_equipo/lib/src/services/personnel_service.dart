import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sar_equipo/src/global/environment.dart';
import '../../Models/personnel_model.dart';

class PersonnelService {
  Future<List<Personnel>> getAll() async {
    final response =
        await http.get(Uri.parse('${Environment.apiURL}/personnel'));

    if (response.statusCode == 200 || response.statusCode == 304) {
      final decoded = await json.decode(response.body);
      var lst = <Personnel>[];
      for (var personnel in decoded) {
        Personnel perl = Personnel.fromJson(personnel);
        lst.add(perl);
      }
      return lst;
    }
    return [];
  }

  Future<Type> getOnePersonnel(int id) async {
    final response =
        await http.get(Uri.parse('${Environment.apiURL}/personnel/${id}'));
    var perl = Personnel;
    if (response.statusCode == 200 || response.statusCode == 304) {
      final decoded = await json.decode(response.body);
      for (var personnel in decoded) {
        Personnel perl = Personnel.fromJson(personnel);
      }
      return perl;
    }
    return perl;
  }

  Future<http.Response> postPerson(Personnel p) async {
    print(json.encode(p.toInsertJson()));
    final response =
        await http.post(Uri.parse('${Environment.apiURL}/personnel'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: json.encode(p.toInsertJson()));
    return response;
  }

  Future<http.Response> putPerson(Personnel p) async {
    final response = await http.patch(
        Uri.parse('${Environment.apiURL}/personnel/ ${p.id}'),
        body: p.toJson());
    return response;
  }

  Future<http.Response> deletePerson(Personnel p) async {
    final response = await http
        .delete(Uri.parse('${Environment.apiURL}/personnel/ ${p.id}'));
    return response;
  }
}
