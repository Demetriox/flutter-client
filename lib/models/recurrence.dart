// To parse this JSON data, do
//
//     final recurrence = recurrenceFromJson(jsonString);

import 'dart:convert';

Recurrence recurrenceFromJson(String str) =>
    Recurrence.fromJson(json.decode(str));

String recurrenceToJson(Recurrence data) => json.encode(data.toJson());

class Recurrence {
  Recurrence({
    this.id,
    this.displayName,
  });

  String? id;
  String? displayName;

  factory Recurrence.fromJson(Map<String, dynamic> json) => Recurrence(
        id: json["id"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
      };
}
