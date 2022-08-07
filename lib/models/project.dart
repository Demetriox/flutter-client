import 'dart:convert';

import 'package:sprint/models/client.dart';

import 'flow.dart';

Project projectFromJson(String str) => Project.fromJson(json.decode(str));

String projectToJson(Project data) => json.encode(data.toJson());

class Project {
  String id;
  String name;
  String description;
  DateTime createdDate;
  DateTime deliveryDate;
  String progress;
  Client client;
  List<Flow> flows;

  Project(
    this.id,
    this.name,
    this.description,
    this.createdDate,
    this.deliveryDate,
    this.progress,
    this.client,
    this.flows,
  );

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        json["id"],
        json["name"],
        json["description"],
        json["createdDate"],
        json["deliveryDate"],
        json["progress"],
        json["client"],
        json["flows"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createdDate": createdDate,
        "deliveryDate": deliveryDate,
        "progress": progress,
        "client": client,
        "flows": flows,
      };
}
