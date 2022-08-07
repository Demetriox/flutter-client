import 'dart:convert';

import 'package:sprint/models/area.dart';

import 'user.dart';

Step flowFromJson(String str) => Step.fromJson(json.decode(str));

String flowToJson(Step data) => json.encode(data.toJson());

class Step {
  String id;
  Area area;
  String color;
  String comments;
  List<User> assigned;
  List<Step> dependants;
  List<Step> dependsOn;

  Step(
    this.id,
    this.area,
    this.color,
    this.comments,
    this.assigned,
    this.dependants,
    this.dependsOn,
  );

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        json["id"],
        json["area"],
        json["color"],
        json["comments"],
        json["assigned"],
        json["dependants"],
        json["dependsOn"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "area": area,
        "color": color,
        "comments": comments,
        "assigned": assigned,
        "dependants": dependants,
        "dependsOn": dependsOn,
      };
}
