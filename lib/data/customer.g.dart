// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      json['name'] as String,
      json['age'] as int,
      json['score'] as int,
      (json['carts'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'score': instance.score,
      'carts': instance.carts,
    };

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      json['id'] as String,
      json['score'] as int,
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'id': instance.id,
      'score': instance.score,
    };
