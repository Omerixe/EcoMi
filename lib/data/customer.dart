import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  final String id;
  final List<Purchase> purchases;

  Customer(this.id, this.purchases);

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable()
class Purchase {
  final String timestamp;
  @JsonKey(name: 'unix_timestamp')
  final int unixTimeStamp;

  Purchase(this.timestamp, this.unixTimeStamp);

  factory Purchase.fromJson(Map<String, dynamic> json) =>
      _$PurchaseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseToJson(this);
}
