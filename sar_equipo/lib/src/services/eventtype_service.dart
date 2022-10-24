import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sar_equipo/src/global/environment.dart';
import '../../Models/event_type_model.dart';

class EventTypeService{
  Future<List<EventType>> getAll() async {
    final response =  await http.get(Uri.parse('${Environment.apiURL}/eventtype'));
    
    if(response.statusCode == 200 || response.statusCode == 304){
      final decoded = await json.decode(response.body);
      var lst = <EventType>[];
      for(var eventtype in decoded){
        EventType eventT =  EventType.fromJson(eventtype);
        lst.add(eventT);
      }
      return lst;
    }
    return [];
  }

  Future<Type> getOneEventType(int id) async {
    final response =  await http.get(Uri.parse('${Environment.apiURL}/eventtype/${id}'));
    var eventT = EventType;
    if(response.statusCode == 200 || response.statusCode == 304){
      final decoded = await json.decode(response.body);
      for(var eventtype in decoded){
        EventType eventT =  EventType.fromJson(eventtype);
      }
      return eventT;
    }
    return eventT;
  }

  Future<http.Response> postEventType(EventType et) async {
    final response =  await http.post(Uri.parse('${Environment.apiURL}/eventtype'), body: et.toInsertJson());
    return response;
  }

  Future<http.Response> putEventType(EventType et) async {
    final response =  await http.patch(Uri.parse('${Environment.apiURL}/eventtype/ ${et.id}'), body: et.toJson());
    return response;
  }

  Future<http.Response> deleteEventType(EventType et) async {
    final response =  await http.delete(Uri.parse('${Environment.apiURL}/eventtype/ ${et.id}'));
    return response;
  }
}