// To parse this JSON data, do
//
//     final paymentMethod = paymentMethodFromJson(jsonString);

import 'dart:convert';

PaymentMethod paymentMethodFromJson(String str) =>
    PaymentMethod.fromJson(json.decode(str));

String paymentMethodToJson(PaymentMethod data) => json.encode(data.toJson());

class PaymentMethod {
  PaymentMethod({
    this.id,
    this.displayName,
  });

  String? id;
  String? displayName;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        id: json["id"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
      };
}
