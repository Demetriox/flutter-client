import 'dart:convert';

Role roleFromJson(String str) => Role.fromJson(json.decode(str));

String roleToJson(Role data) => json.encode(data.toJson());

class Role {
  Role({
    this.id,
    this.displayName,
    this.permissions,
  });

  String? id;
  String? displayName;
  List<Permission>? permissions;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        displayName: json["displayName"],
        permissions: json["permissions"] == null
            ? null
            : List<Permission>.from(
                json["permissions"].map(
                  (x) => Permission.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
        "permissions": permissions == null
            ? null
            : List<dynamic>.from(permissions!.map((x) => x.toJson())),
      };
}

class Permission {
  Permission({
    this.id,
    this.displayName,
  });

  String? id;
  String? displayName;

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        id: json["id"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
      };
}
