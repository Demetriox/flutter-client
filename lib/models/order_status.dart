// To parse this JSON data, do
//
//     final orderStatus = orderStatusFromJson(jsonString);

import 'dart:convert';

OrderStatus orderStatusFromJson(String str) =>
    OrderStatus.fromJson(json.decode(str));

String orderStatusToJson(OrderStatus data) => json.encode(data.toJson());

class OrderStatus {
  OrderStatus({
    this.id,
    this.displayName,
  });

  String? id;
  String? displayName;

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
        id: json["id"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
      };
}
