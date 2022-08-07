import 'dart:convert';

import 'package:sprint/models/step.dart';

Flow flowFromJson(String str) => Flow.fromJson(json.decode(str));

String flowToJson(Flow data) => json.encode(data.toJson());

class Flow {
  String id;
  String name;
  String description;
  List<Step> steps;

  Flow(
    this.id,
    this.name,
    this.description,
    this.steps,
  );

  factory Flow.fromJson(Map<String, dynamic> json) => Flow(
        json["id"],
        json["name"],
        json["description"],
        json["steps"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "steps": steps,
      };
}
