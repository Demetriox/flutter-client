import 'dart:convert';

Service serviceFromJson(String str) => Service.fromJson(json.decode(str));

String serviceToJson(Service data) => json.encode(data.toJson());

class Service {
  Service({
    this.id,
    this.displayName,
    this.description,
    this.recurrence,
    this.specification,
  });

  String? id;
  String? displayName;
  String? description;
  String? recurrence;
  Map<String, String>? specification;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
      id: json["id"],
      displayName: json["displayName"],
      description: json["description"],
      recurrence: json["recurrence"],
      specification: json["specification"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
        "description": description,
        "recurrence": recurrence,
        "specification": specification,
      };
}
