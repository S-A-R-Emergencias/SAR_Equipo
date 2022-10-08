import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sar_equipo/src/global/environment.dart';

import '../../Models/personnel_model.dart';

class PersonnelService{
  Future<List<Personnel>> getAll() async {
    final response =  await http.get(Uri.parse('${Environment.apiURL}/personnel'));
    if(response.statusCode == 200 ){
      final decoded = await json.decode(response.body);
      var lst = <Personnel>[];
      for(var personnel in decoded){
        var per = new Personnel.fromJson(personnel);
        lst.add(per);
      }
      return lst;
    }
    return [];
  }
}