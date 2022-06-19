// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.id,
    this.displayName,
    this.price,
    this.rules,
    this.categories,
    this.specification,
  });

  String? id;
  String? displayName;
  int? price;
  List<Rule>? rules;
  List<Category>? categories;
  Specification? specification;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        displayName: json["displayName"],
        price: json["price"],
        rules: json["rules"] == null
            ? null
            : List<Rule>.from(json["rules"].map((x) => Rule.fromJson(x))),
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
        specification: json["specification"] == null
            ? null
            : Specification.fromJson(json["specification"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
        "price": price,
        "rules": rules == null
            ? null
            : List<dynamic>.from(rules!.map((x) => x.toJson())),
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "specification": specification == null ? null : specification!.toJson(),
      };
}

class Category {
  Category({
    this.id,
    this.displayName,
  });

  String? id;
  String? displayName;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
      };
}

class Rule {
  Rule({
    this.from,
    this.price,
  });

  int? from;
  double? price;

  factory Rule.fromJson(Map<String, dynamic> json) => Rule(
        from: json["from"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "price": price,
      };
}

class Specification {
  Specification({
    this.sliced,
  });

  String? sliced;

  factory Specification.fromJson(Map<String, dynamic> json) => Specification(
        sliced: json["sliced"],
      );

  Map<String, dynamic> toJson() => {
        "sliced": sliced,
      };
}
