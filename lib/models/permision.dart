import 'dart:convert';

Permision permisionFromJson(String str) => Permision.fromJson(json.decode(str));

String permisionToJson(Permision data) => json.encode(data.toJson());

class Permision {
  Permision({
    this.id,
    this.displayName,
  });

  String? id;
  String? displayName;

  factory Permision.fromJson(Map<String, dynamic> json) => Permision(
        id: json["id"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
      };
}
