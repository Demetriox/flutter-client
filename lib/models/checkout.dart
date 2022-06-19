import 'dart:convert';

import 'package:sprint/models/product.dart';

Checkout checkoutFromJson(String str) => Checkout.fromJson(json.decode(str));

String checkoutToJson(Checkout data) => json.encode(data.toJson());

class Checkout {
  Checkout({
    this.id,
    this.date,
    this.client,
    this.products,
    this.services,
    this.checkout,
  });

  String? id;
  DateTime? date;
  Client? client;
  List<Product>? products;
  List<dynamic>? services;
  CheckoutClass? checkout;

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        client: json["client"] == null ? null : Client.fromJson(json["client"]),
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
        services: json["services"] == null
            ? null
            : List<dynamic>.from(json["services"].map((x) => x)),
        checkout: json["checkout"] == null
            ? null
            : CheckoutClass.fromJson(json["checkout"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date == null ? null : date!.toIso8601String(),
        "client": client == null ? null : client!.toJson(),
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "services": services == null
            ? null
            : List<dynamic>.from(services!.map((x) => x)),
        "checkout": checkout == null ? null : checkout!.toJson(),
      };
}

class CheckoutClass {
  CheckoutClass({
    this.subTotal,
    this.total,
  });

  int? subTotal;
  int? total;

  factory CheckoutClass.fromJson(Map<String, dynamic> json) => CheckoutClass(
        subTotal: json["subTotal"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "subTotal": subTotal,
        "total": total,
      };
}

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

class Product {
  Product({
    this.id,
    this.displayName,
    this.price,
    this.quantity,
    this.rules,
  });

  String? id;
  String? displayName;
  int? price;
  int? quantity;
  List<Rule>? rules;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        displayName: json["displayName"],
        price: json["price"],
        quantity: json["quantity"],
        rules: json["rules"] == null
            ? null
            : List<Rule>.from(json["rules"].map((x) => Rule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
        "price": price,
        "quantity": quantity,
        "rules": rules == null
            ? null
            : List<dynamic>.from(rules!.map((x) => x.toJson())),
      };
}
