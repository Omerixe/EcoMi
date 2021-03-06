// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      json['id'] as String,
      (json['animalwelfare_score'] as num).toDouble(),
      (json['climate_score'] as num).toDouble(),
      (json['purchases'] as List<dynamic>)
          .map((e) => Purchase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'animalwelfare_score': instance.animalwelfareScore,
      'climate_score': instance.climateScore,
      'purchases': instance.purchases,
    };

Purchase _$PurchaseFromJson(Map<String, dynamic> json) => Purchase(
      json['unix_timestamp'] as int,
      (json['animalwelfare_score'] as num).toDouble(),
      (json['climate_score'] as num).toDouble(),
    );

Map<String, dynamic> _$PurchaseToJson(Purchase instance) => <String, dynamic>{
      'unix_timestamp': instance.unixTimeStamp,
      'animalwelfare_score': instance.animalwelfareScore,
      'climate_score': instance.climateScore,
    };
