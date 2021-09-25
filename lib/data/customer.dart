import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  final String id;
  final String name;
  final List<Cart> carts;

  Customer(this.id, this.name, this.carts);

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable()
class Cart {
  final String id;
  final int score;

  Cart(this.id, this.score);

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
