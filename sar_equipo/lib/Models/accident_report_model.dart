// To parse this JSON data, do
//
//     final accidentReport = accidentReportFromJson(jsonString);

import 'dart:convert';

AccidentReport accidentReportFromJson(String str) => AccidentReport.fromJson(json.decode(str));

String accidentReportToJson(AccidentReport data) => json.encode(data.toJson());

class AccidentReport {
    AccidentReport({
         this.id,
         this.idEventType,
         this.idUser,
         this.description,
         this.longitude,
         this.latitude,
         this.requestDate,
         this.status,
         this.registerDate,
         this.lastUpdate,
    });

    int? id;
    int? idEventType;
    int? idUser;
    String? description;
    double? longitude;
    double? latitude;
    DateTime? requestDate;
    int? status;
    DateTime? registerDate;
    DateTime? lastUpdate;

    factory AccidentReport.fromJson(Map<String, dynamic> json) => AccidentReport(
        id: json["id"] == null ? null : json["id"],
        idEventType: json["idEventType"] == null ? null : json["idEventType"],
        idUser: json["idUser"] == null ? null : json["idUser"],
        description: json["description"] == null ? null : json["description"],
        longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        requestDate: json["requestDate"] == null ? null : DateTime.parse(json["requestDate"]),
        status: json["status"] == null ? null : json["status"],
        registerDate: json["registerDate"] == null ? null : DateTime.parse(json["registerDate"]),
        lastUpdate: json["lastUpdate"] == null ? null : DateTime.parse(json["lastUpdate"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "idEventType": idEventType == null ? null : idEventType,
        "idUser": idUser == null ? null : idUser,
        "description": description == null ? null : description,
        "longitude": longitude == null ? null : longitude,
        "latitude": latitude == null ? null : latitude,
        "requestDate": requestDate == null ? null : "${requestDate?.year.toString().padLeft(4, '0')}-${requestDate?.month.toString().padLeft(2, '0')}-${requestDate?.day.toString().padLeft(2, '0')}",
        "status": status == null ? null : status,
        "registerDate": registerDate == null ? null : "${registerDate?.year.toString().padLeft(4, '0')}-${registerDate?.month.toString().padLeft(2, '0')}-${registerDate?.day.toString().padLeft(2, '0')}",
        "lastUpdate": lastUpdate == null ? null : "${lastUpdate?.year.toString().padLeft(4, '0')}-${lastUpdate?.month.toString().padLeft(2, '0')}-${lastUpdate?.day.toString().padLeft(2, '0')}",
    };

    Map<String, dynamic> toInsertJson() => {
        "idEventType": idEventType == null ? null : idEventType,
        "idUser": idUser == null ? null : idUser,
        "description": description == null ? null : description,
        "longitude": longitude == null ? null : longitude,
        "latitude": latitude == null ? null : latitude,
        "requestDate": requestDate == null ? null : "${requestDate?.year.toString().padLeft(4, '0')}-${requestDate?.month.toString().padLeft(2, '0')}-${requestDate?.day.toString().padLeft(2, '0')}",   };
}
