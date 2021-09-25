import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  final String id;
  @JsonKey(name: 'animalwelfare_score')
  final double animalwelfareScore;
  @JsonKey(name: 'climate_score')
  final double climateScore;
  final List<Purchase> purchases;

  Customer(this.id, this.animalwelfareScore, this.climateScore, this.purchases);

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable()
class Purchase {
  @JsonKey(name: 'unix_timestamp')
  final int unixTimeStamp;
  @JsonKey(name: 'animalwelfare_score')
  final double animalwelfareScore;
  @JsonKey(name: 'climate_score')
  final double climateScore;

  Purchase(this.unixTimeStamp, this.animalwelfareScore, this.climateScore);

  factory Purchase.fromJson(Map<String, dynamic> json) =>
      _$PurchaseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseToJson(this);
}
