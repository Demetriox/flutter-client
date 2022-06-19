// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

Client clientFromJson(String str) => Client.fromJson(json.decode(str));

String clientToJson(Client data) => json.encode(data.toJson());

class Client {
  Client({
    this.id,
    this.displayName,
    this.address,
    this.cellular,
    this.officeNumber,
    this.businessName,
  });

  String? id;
  String? displayName;
  String? address;
  String? cellular;
  String? officeNumber;
  String? businessName;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        displayName: json["displayName"],
        address: json["address"],
        cellular: json["cellular"],
        officeNumber: json["office_number"],
        businessName: json["business_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
        "address": address,
        "cellular": cellular,
        "office_number": officeNumber,
        "business_name": businessName,
      };
}
