// To parse this JSON data, do
//
//     final Element_m = Element_mFromJson(jsonString);

import 'dart:convert';

Element_m Element_mFromJson(String str) => Element_m.fromJson(json.decode(str));

String Element_mToJson(Element_m data) => json.encode(data.toJson());

class Element_m {
    Element_m({
      this.id,
      this.name,
      this.serialNumber,
      this.amount,
      this.description,
      this.unitOfMeasurement,
      this.image,
      this.status,
      this.registerDate,
      this.lastUpdate,
      this.user,
      this.idElementType,
    });

  int? id;
  String? name;
  int? serialNumber;
  int? amount;
  String? description;
  String? unitOfMeasurement;
  String? image;
  int? status;
  DateTime? registerDate;
  DateTime? lastUpdate;
  int? user;
  int? idElementType;

    factory Element_m.fromJson(Map<String, dynamic> json) => Element_m(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        serialNumber:
            json["serialNumber"] == null ? null : json["serialNumber"],
        amount: json["amount"] == null ? null : json["amount"],
        description: json["description"] == null ? null : json["description"],
        unitOfMeasurement: json["unitOfMeasurement"] == null
            ? null
            : json["unitOfMeasurement"],
        image: json["image"] == null ? null : json["image"],
        status: json["status"] == null ? null : json["status"],
        registerDate: json["registerDate"] == null
            ? null
            : DateTime.parse(json["registerDate"]),
        lastUpdate: json["lastUpdate"] == null
            ? null
            : DateTime.parse(json["lastUpdate"]),
        user: json["User"] == null ? null : json["User"],
        idElementType:
            json["idElementType"] == null ? null : json["idElementType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "serialNumber": serialNumber == null ? null : int.parse(serialNumber.toString()),
        "amount": amount == null ? null : int.parse(amount.toString()),
        "description": description == null ? null : description,
        "unitOfMeasurement":
            unitOfMeasurement == null ? null : unitOfMeasurement,
        "image": image == null ? null : image,
        "status": status == null ? null : status,
        "registerDate": registerDate == null
            ? null
            : "${registerDate?.year.toString().padLeft(4, '0')}-${registerDate?.month.toString().padLeft(2, '0')}-${registerDate?.day.toString().padLeft(2, '0')}",
        "lastUpdate": lastUpdate == null
            ? null
            : "${lastUpdate?.year.toString().padLeft(4, '0')}-${lastUpdate?.month.toString().padLeft(2, '0')}-${lastUpdate?.day.toString().padLeft(2, '0')}",
        "User": user == null ? null : user,
        "idElementType": idElementType == null ? null : idElementType,
      };

  Map<String, dynamic> toInsertJson() => {
        "name": name == null ? null : name,
        "serialNumber": serialNumber == null ? null : serialNumber,
        "amount": amount == null ? null : amount,
        "description": description == null ? null : description,
        "unitOfMeasurement":
            unitOfMeasurement == null ? null : unitOfMeasurement,
        "image": image == null ? null : image,
        "User": user == null ? null : user,
        "idElementType": idElementType == null ? null : idElementType,
      };
}











