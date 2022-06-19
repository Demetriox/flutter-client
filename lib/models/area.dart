import 'dart:convert';

Area areaFromJson(String str) => Area.fromJson(json.decode(str));

String areaToJson(Area data) => json.encode(data.toJson());

class Area {
  Area({
    this.id,
    this.displayName,
  });

  String? id;
  String? displayName;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
      };
}
