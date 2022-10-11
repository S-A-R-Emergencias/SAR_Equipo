// To parse this JSON data, do
//
//     final elementType = elementTypeFromJson(jsonString);

import 'dart:convert';

EventType elementTypeFromJson(String str) => EventType.fromJson(json.decode(str));

String elementTypeToJson(EventType data) => json.encode(data.toJson());

class EventType {
    EventType({
        this.id,
        this.name,
        this.description,
        this.status,
        this.registerDate,
        this.lastUpdate,
    });

    int? id;
    String? name;
    String? description;
    int? status;
    DateTime? registerDate;
    DateTime? lastUpdate;

    factory EventType.fromJson(Map<String, dynamic> json) => EventType(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        status: json["status"] == null ? null : json["status"],
        registerDate: json["registerDate"] == null ? null : DateTime.parse(json["registerDate"]),
        lastUpdate: json["lastUpdate"] == null ? null : DateTime.parse(json["lastUpdate"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "status": status == null ? null : status,
        "registerDate": registerDate == null ? null : "${registerDate?.year.toString().padLeft(4, '0')}-${registerDate?.month.toString().padLeft(2, '0')}-${registerDate?.day.toString().padLeft(2, '0')}",
        "lastUpdate": lastUpdate == null ? null : "${lastUpdate?.year.toString().padLeft(4, '0')}-${lastUpdate?.month.toString().padLeft(2, '0')}-${lastUpdate?.day.toString().padLeft(2, '0')}",
    };

    Map<String, dynamic> toInsertJson() => {
        "name": name == null ? null : name,
        "description": description == null ? null : description,
    };
}