// To parse this JSON data, do
//
//     final personnel = personnelFromJson(jsonString);

import 'dart:convert';

Personnel personnelFromJson(String str) => Personnel.fromJson(json.decode(str));

String personnelToJson(Personnel data) => json.encode(data.toJson());

class Personnel {
  Personnel({
    this.id,
    this.name,
    this.lastName,
    this.secondLastName,
    this.ci,
    this.address,
    this.birthDate,
    this.email,
    this.telephone,
    this.registerDate,
    this.lastUpdate,
    this.password,
    this.role,
    this.image,
    this.grade,
    this.bloodType,
    this.allergies,
  });

  int? id;
  String? name;
  String? lastName;
  String? secondLastName;
  int? ci;
  String? address;
  DateTime? birthDate;
  String? email;
  int? telephone;
  DateTime? registerDate;
  DateTime? lastUpdate;
  String? password;
  String? role;
  String? image;
  String? grade;
  String? bloodType;
  String? allergies;

  factory Personnel.fromJson(Map<String, dynamic> json) => Personnel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        secondLastName:
            json["secondLastName"] == null ? null : json["secondLastName"],
        ci: json["ci"] == null ? null : json["ci"],
        address: json["address"] == null ? null : json["address"],
        birthDate: json["birthDate"] == null
            ? null
            : DateTime.parse(json["birthDate"]),
        email: json["email"] == null ? null : json["email"],
        telephone: json["telephone"] == null ? null : json["telephone"],
        registerDate: json["registerDate"] == null
            ? null
            : DateTime.parse(json["registerDate"]),
        lastUpdate: json["lastUpdate"] == null
            ? null
            : DateTime.parse(json["lastUpdate"]),
        password: json["password"] == null ? null : json["password"],
        role: json["role"] == null ? null : json["role"],
        image: json["image"] == null ? null : json["image"],
        grade: json["grade"] == null ? null : json["grade"],
        bloodType: json["bloodType"] == null ? null : json["bloodType"],
        allergies: json["allergies"] == null ? null : json["allergies"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "lastName": lastName == null ? null : lastName,
        "secondLastName": secondLastName == null ? null : secondLastName,
        "ci": ci == null ? null : ci,
        "address": address == null ? null : address,
        "birthDate": birthDate == null ? null : birthDate!.year.toString()+'-'+ birthDate!.month.toString()+'-'+ birthDate!.day.toString(),
        "email": email == null ? null : email,
        "telephone": telephone == null ? null : telephone,
        "registerDate":
            registerDate == null ? null : registerDate?.toIso8601String(),
        "lastUpdate": lastUpdate == null ? null : lastUpdate?.toIso8601String(),
        "password": password == null ? null : password,
        "role": role == null ? null : role,
        "image": image == null ? null : image,
        "grade": grade == null ? null : grade,
        "bloodType": bloodType == null ? null : bloodType,
        "allergies": allergies == null ? null : allergies,
      };

  Map<String, dynamic> toInsertJson() => {
        "name": name == null ? null : name,
        "lastName": lastName == null ? null : lastName,
        "secondLastName": secondLastName == null ? null : secondLastName,
        "ci": ci == null ? null : ci,
        "address": address == null ? null : address,
        "birthDate": birthDate == null ? null : birthDate!.year.toString()+'-'+ birthDate!.month.toString()+'-'+ birthDate!.day.toString(),
        "email": email == null ? null : email,
        "telephone": telephone == null ? null : telephone,
        "password": password == null ? null : password,
        "role": role == null ? null : role,
        "image": image == null ? null : image,
        "grade": grade == null ? null : grade,
        "bloodType": bloodType == null ? null : bloodType,
        "allergies": allergies == null ? null : allergies,
      };
}
