// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Purchase _$PurchaseFromJson(Map<String, dynamic> json) => Purchase(
      json['id'] as String,
      (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['score'] as int,
    );

Map<String, dynamic> _$PurchaseToJson(Purchase instance) => <String, dynamic>{
      'id': instance.id,
      'products': instance.products,
      'score': instance.score,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['id'] as String,
      json['name'] as String,
      json['score'] as int,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'score': instance.score,
    };
