// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      json['id'] as String,
      (json['purchases'] as List<dynamic>)
          .map((e) => Purchase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'purchases': instance.purchases,
    };

Purchase _$PurchaseFromJson(Map<String, dynamic> json) => Purchase(
      json['id'] as String,
      json['score'] as int,
    );

Map<String, dynamic> _$PurchaseToJson(Purchase instance) => <String, dynamic>{
      'id': instance.id,
      'score': instance.score,
    };
