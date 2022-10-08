// To parse this JSON data, do
//
//     final personnel = personnelFromJson(jsonString);

import 'dart:convert';

Personnel personnelFromJson(String str) => Personnel.fromJson(json.decode(str));

String personnelToJson(Personnel data) => json.encode(data.toJson());

class Personnel{
    Personnel({
        required this.id,
        required this.grade,
        required this.bloodType,
        required this.allergies,
        this.status,
        this.registerDate,
        this.lastUpdate,
    });

    int id;
    String grade;
    String bloodType;
    String allergies;
    int? status;
    DateTime? registerDate;
    DateTime? lastUpdate;

    factory Personnel.fromJson(Map<String, dynamic> json) => Personnel(
        id: json["id"],
        grade: json["grade"],
        bloodType: json["bloodType"],
        allergies: json["allergies"],
        status: json["status"],
        registerDate: DateTime.parse(json["registerDate"]),
        lastUpdate: DateTime.parse(json["lastUpdate"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "grade": grade,
        "bloodType": bloodType,
        "allergies": allergies,
        "status": status,
        "registerDate": "${registerDate?.year.toString().padLeft(4, '0')}-${registerDate?.month.toString().padLeft(2, '0')}-${registerDate?.day.toString().padLeft(2, '0')}",
        "lastUpdate": "${lastUpdate?.year.toString().padLeft(4, '0')}-${lastUpdate?.month.toString().padLeft(2, '0')}-${lastUpdate?.day.toString().padLeft(2, '0')}",
    };

    Map<String, dynamic> toInsertJson() => {
        "id": id,
        "grade": grade,
        "bloodType": bloodType,
        "allergies": allergies,
    };
}
