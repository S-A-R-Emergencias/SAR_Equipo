// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
    Person({
        this.id,
        required this.name,
        required this.lastName,
        required this.secondLastName,
        required this.ci,
        required this.address,
        required this.birthDate,
        required this.email,
        required this.telephone,
        this.status,
        this.registerDate,
        this.lastUpdate,
        required this.password,
        required this.role,
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
    int? status;
    DateTime? registerDate;
    DateTime? lastUpdate;
    String? password;
    String? role;

    factory Person.fromJson(dynamic json) => Person(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        secondLastName: json["secondLastName"] == null ? null : json["secondLastName"],
        ci: json["ci"] == null ? null : json["ci"],
        address: json["address"] == null ? null : json["address"],
        birthDate: json["birthDate"] == null ? null : DateTime.parse(json["birthDate"]),
        email: json["email"] == null ? null : json["email"],
        telephone: json["telephone"] == null ? null : json["telephone"],
        status: json["status"] == null ? null : json["status"],
        registerDate: json["registerDate"] == null ? null : DateTime.parse(json["registerDate"]),
        lastUpdate: json["lastUpdate"] == null ? null : DateTime.parse(json["lastUpdate"]),
        password: json["password"] == null ? null : json["password"],
        role: json["role"] == null ? null : json["role"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "lastName": lastName == null ? null : lastName,
        "secondLastName": secondLastName == null ? null : secondLastName,
        "ci": ci == null ? null : ci,
        "address": address == null ? null : address,
        "birthDate": birthDate == null ? null : birthDate?.toIso8601String(),
        "email": email == null ? null : email,
        "telephone": telephone == null ? null : telephone,
        "status": status == null ? null : status,
        "registerDate": registerDate == null ? null : registerDate?.toIso8601String(),
        "lastUpdate": lastUpdate == null ? null : lastUpdate?.toIso8601String(),
        "password": password == null ? null : password,
        "role": role == null ? null : role,
    };

    Map<String, dynamic> toInsertJson() => {
        "name": name == null ? null : name,
        "lastName": lastName == null ? null : lastName,
        "secondLastName": secondLastName == null ? null : secondLastName,
        "ci": ci == null ? null : ci,
        "address": address == null ? null : address,
        "birthDate": birthDate == null ? null : birthDate?.toIso8601String(),
        "email": email == null ? null : email,
        "telephone": telephone == null ? null : telephone,
        "password": password == null ? null : password,
        "role": role == null ? null : role,
    };
}
