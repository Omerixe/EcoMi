import 'package:json_annotation/json_annotation.dart';

part 'purchase.g.dart';

@JsonSerializable()
class Purchase {
  final String id;
  final List<Product> products;
  final int score;

  Purchase(this.id, this.products, this.score);

  factory Purchase.fromJson(Map<String, dynamic> json) =>
      _$PurchaseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseToJson(this);
}

@JsonSerializable()
class Product {
  final String id;
  final String name;
  final int score;

  Product(this.id, this.name, this.score);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
