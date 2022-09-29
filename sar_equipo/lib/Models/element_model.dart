// To parse this JSON data, do
//
//     final element = elementFromJson(jsonString);

import 'dart:convert';

Element elementFromJson(String str) => Element.fromJson(json.decode(str));

String elementToJson(Element data) => json.encode(data.toJson());

class Element {
    Element({
        required this.id,
        required this.name,
        required this.serialNumber,
        required this.amount,
        required this.description,
        required this.unitOfMeasurement,
        required this.status,
        required this.registerDate,
        required this.lastUpdate,
        required this.user,
        required this.idElementType,
    });

    int id;
    String name;
    int serialNumber;
    int amount;
    String description;
    String unitOfMeasurement;
    int status;
    DateTime registerDate;
    DateTime lastUpdate;
    int user;
    int idElementType;

    factory Element.fromJson(Map<String, dynamic> json) => Element(
        id: json["id"],
        name: json["name"],
        serialNumber: json["serialNumber"],
        amount: json["amount"],
        description: json["description"],
        unitOfMeasurement: json["unitOfMeasurement"],
        status: json["status"],
        registerDate: DateTime.parse(json["registerDate"]),
        lastUpdate: DateTime.parse(json["lastUpdate"]),
        user: json["User"],
        idElementType: json["idElementType"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "serialNumber": serialNumber,
        "amount": amount,
        "description": description,
        "unitOfMeasurement": unitOfMeasurement,
        "status": status,
        "registerDate": "${registerDate.year.toString().padLeft(4, '0')}-${registerDate.month.toString().padLeft(2, '0')}-${registerDate.day.toString().padLeft(2, '0')}",
        "lastUpdate": "${lastUpdate.year.toString().padLeft(4, '0')}-${lastUpdate.month.toString().padLeft(2, '0')}-${lastUpdate.day.toString().padLeft(2, '0')}",
        "User": user,
        "idElementType": idElementType,
    };

    Map<String, dynamic> toInsertJson() => {
        "name": name,
        "serialNumber": serialNumber,
        "amount": amount,
        "description": description,
        "unitOfMeasurement": unitOfMeasurement,
        "User": user,
        "idElementType": idElementType,
    };
}
