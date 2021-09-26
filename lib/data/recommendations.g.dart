// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recommendations _$RecommendationsFromJson(Map<String, dynamic> json) =>
    Recommendations(
      (json['good'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['bad'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecommendationsToJson(Recommendations instance) =>
    <String, dynamic>{
      'good': instance.good,
      'bad': instance.bad,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      Img.fromJson(json['image'] as Map<String, dynamic>),
      MCheck.fromJson(json['m_check2'] as Map<String, dynamic>),
      json['name'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'image': instance.image,
      'm_check2': instance.mCheck,
      'name': instance.name,
    };

Img _$ImgFromJson(Map<String, dynamic> json) => Img(
      json['original'] as String,
    );

Map<String, dynamic> _$ImgToJson(Img instance) => <String, dynamic>{
      'original': instance.original,
    };

MCheck _$MCheckFromJson(Map<String, dynamic> json) => MCheck(
      AnimalWelfare.fromJson(json['animal_welfare'] as Map<String, dynamic>),
      CarbonFootprint.fromJson(
          json['carbon_footprint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MCheckToJson(MCheck instance) => <String, dynamic>{
      'animal_welfare': instance.animalWelfare,
      'carbon_footprint': instance.carbonFootprint,
    };

AnimalWelfare _$AnimalWelfareFromJson(Map<String, dynamic> json) =>
    AnimalWelfare(
      json['rating'] as int,
    );

Map<String, dynamic> _$AnimalWelfareToJson(AnimalWelfare instance) =>
    <String, dynamic>{
      'rating': instance.rating,
    };

CarbonFootprint _$CarbonFootprintFromJson(Map<String, dynamic> json) =>
    CarbonFootprint(
      Footprint.fromJson(json['ground_and_sea_cargo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CarbonFootprintToJson(CarbonFootprint instance) =>
    <String, dynamic>{
      'ground_and_sea_cargo': instance.groundAndSea,
    };

Footprint _$FootprintFromJson(Map<String, dynamic> json) => Footprint(
      json['rating'] as int,
    );

Map<String, dynamic> _$FootprintToJson(Footprint instance) => <String, dynamic>{
      'rating': instance.rating,
    };
