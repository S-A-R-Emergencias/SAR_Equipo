// To parse this JSON data, do
//
//     final elementType = elementTypeFromJson(jsonString);

import 'dart:convert';

ElementType elementTypeFromJson(String str) => ElementType.fromJson(json.decode(str));

String elementTypeToJson(ElementType data) => json.encode(data.toJson());

class ElementType {
    ElementType({
        required this.id,
        required this.name,
        required this.status,
        required this.registerDate,
        required this.lastUpdate,
        required this.user,
    });

    int id;
    String name;
    int status;
    DateTime registerDate;
    DateTime lastUpdate;
    int user;

    factory ElementType.fromJson(Map<String, dynamic> json) => ElementType(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        registerDate: DateTime.parse(json["registerDate"]),
        lastUpdate: DateTime.parse(json["lastUpdate"]),
        user: json["User"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "registerDate": "${registerDate.year.toString().padLeft(4, '0')}-${registerDate.month.toString().padLeft(2, '0')}-${registerDate.day.toString().padLeft(2, '0')}",
        "lastUpdate": "${lastUpdate.year.toString().padLeft(4, '0')}-${lastUpdate.month.toString().padLeft(2, '0')}-${lastUpdate.day.toString().padLeft(2, '0')}",
        "User": user,
    };

    Map<String, dynamic> toInsertJson() => {
        "name": name,
        "User": user,
    };
}
