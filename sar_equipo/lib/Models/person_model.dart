// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
    Person({
        required this.id,
        required this.name,
        required this.lastName,
        required this.secondLastName,
        required this.ci,
        required this.address,
        required this.birthDate,
        required this.email,
        required this.telephone,
        required this.status,
        required this.registerDate,
        required this.lastUpdate,
        required this.password,
        required this.role,
    });

    int id;
    String name;
    String lastName;
    String secondLastName;
    int ci;
    String address;
    DateTime birthDate;
    String email;
    int telephone;
    int status;
    DateTime registerDate;
    DateTime lastUpdate;
    String password;
    String role;

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        name: json["name"],
        lastName: json["lastName"],
        secondLastName: json["secondLastName"],
        ci: json["ci"],
        address: json["address"],
        birthDate: DateTime.parse(json["birthDate"]),
        email: json["email"],
        telephone: json["telephone"],
        status: json["status"],
        registerDate: DateTime.parse(json["registerDate"]),
        lastUpdate: DateTime.parse(json["lastUpdate"]),
        password: json["password"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastName": lastName,
        "secondLastName": secondLastName,
        "ci": ci,
        "address": address,
        "birthDate": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "email": email,
        "telephone": telephone,
        "status": status,
        "registerDate": "${registerDate.year.toString().padLeft(4, '0')}-${registerDate.month.toString().padLeft(2, '0')}-${registerDate.day.toString().padLeft(2, '0')}",
        "lastUpdate": "${lastUpdate.year.toString().padLeft(4, '0')}-${lastUpdate.month.toString().padLeft(2, '0')}-${lastUpdate.day.toString().padLeft(2, '0')}",
        "password": password,
        "role": role,
    };
}
