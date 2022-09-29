// To parse this JSON data, do
//
//     final accidentReport = accidentReportFromJson(jsonString);

import 'dart:convert';

AccidentReport accidentReportFromJson(String str) => AccidentReport.fromJson(json.decode(str));

String accidentReportToJson(AccidentReport data) => json.encode(data.toJson());

class AccidentReport {
    AccidentReport({
        required this.id,
        required this.idEventType,
        required this.idUser,
        required this.description,
        required this.longitude,
        required this.latitude,
        required this.requestDate,
        required this.status,
        required this.registerDate,
        required this.lastUpdate,
    });

    int id;
    int idEventType;
    int idUser;
    String description;
    double longitude;
    double latitude;
    DateTime requestDate;
    int status;
    DateTime registerDate;
    DateTime lastUpdate;

    factory AccidentReport.fromJson(Map<String, dynamic> json) => AccidentReport(
        id: json["id"],
        idEventType: json["idEventType"],
        idUser: json["idUser"],
        description: json["description"],
        longitude: json["longitude"].toDouble(),
        latitude: json["latitude"].toDouble(),
        requestDate: DateTime.parse(json["requestDate"]),
        status: json["status"],
        registerDate: DateTime.parse(json["registerDate"]),
        lastUpdate: DateTime.parse(json["lastUpdate"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idEventType": idEventType,
        "idUser": idUser,
        "description": description,
        "longitude": longitude,
        "latitude": latitude,
        "requestDate": "${requestDate.year.toString().padLeft(4, '0')}-${requestDate.month.toString().padLeft(2, '0')}-${requestDate.day.toString().padLeft(2, '0')}",
        "status": status,
        "registerDate": "${registerDate.year.toString().padLeft(4, '0')}-${registerDate.month.toString().padLeft(2, '0')}-${registerDate.day.toString().padLeft(2, '0')}",
        "lastUpdate": "${lastUpdate.year.toString().padLeft(4, '0')}-${lastUpdate.month.toString().padLeft(2, '0')}-${lastUpdate.day.toString().padLeft(2, '0')}",
    };

    Map<String, dynamic> toInsertJson() => {
        "idEventType": idEventType,
        "idUser": idUser,
        "description": description,
        "longitude": longitude,
        "latitude": latitude,
        "requestDate": "${requestDate.year.toString().padLeft(4, '0')}-${requestDate.month.toString().padLeft(2, '0')}-${requestDate.day.toString().padLeft(2, '0')}",
    };
}
