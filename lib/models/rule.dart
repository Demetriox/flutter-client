import 'dart:convert';

Rule ruleFromJson(String str) => Rule.fromJson(json.decode(str));

String ruleToJson(Rule data) => json.encode(data.toJson());

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
