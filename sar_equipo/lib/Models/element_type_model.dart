// To parse this JSON data, do
//
//     final elementType = elementTypeFromJson(jsonString);

import 'dart:convert';

ElementType elementTypeFromJson(String str) => ElementType.fromJson(json.decode(str));

String elementTypeToJson(ElementType data) => json.encode(data.toJson());

class ElementType {
    ElementType({
        this.id,
        this.name,
        this.status,
        this.registerDate,
        this.lastUpdate,
        this.user,
    });

    int? id;
    String? name;
    int? status;
    DateTime? registerDate;
    DateTime? lastUpdate;
    int? user;

    factory ElementType.fromJson(Map<String, dynamic> json) => ElementType(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        status: json["status"] == null ? null : json["status"],
        registerDate: json["registerDate"] == null ? null : DateTime.parse(json["registerDate"]),
        lastUpdate: json["lastUpdate"] == null ? null : DateTime.parse(json["lastUpdate"]),
        user: json["User"] == null ? null : json["User"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "status": status == null ? null : status,
        "registerDate": registerDate == null ? null : "${registerDate?.year.toString().padLeft(4, '0')}-${registerDate?.month.toString().padLeft(2, '0')}-${registerDate?.day.toString().padLeft(2, '0')}",
        "lastUpdate": lastUpdate == null ? null : "${lastUpdate?.year.toString().padLeft(4, '0')}-${lastUpdate?.month.toString().padLeft(2, '0')}-${lastUpdate?.day.toString().padLeft(2, '0')}",
        "User": user == null ? null : user,
    };

    Map<String, dynamic> toInsertJson() => {
        "name": name == null ? null : name,
       "User": user == null ? null : user,
    };
}
