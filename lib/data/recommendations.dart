import 'package:json_annotation/json_annotation.dart';

part 'recommendations.g.dart';

@JsonSerializable()
class Recommendations {
  final List<Product> good;
  final List<Product> bad;

  Recommendations(this.good, this.bad);

  factory Recommendations.fromJson(Map<String, dynamic> json) =>
      _$RecommendationsFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendationsToJson(this);
}

@JsonSerializable()
class Product {
  final Img image;
  @JsonKey(name: 'm_check2')
  final MCheck mCheck;
  final String name;

  Product(this.image, this.mCheck, this.name);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Img {
  final String original;

  Img(this.original);

  factory Img.fromJson(Map<String, dynamic> json) => _$ImgFromJson(json);

  Map<String, dynamic> toJson() => _$ImgToJson(this);
}

@JsonSerializable()
class MCheck {
  @JsonKey(name: 'animal_welfare')
  final AnimalWelfare animalWelfare;
  @JsonKey(name: 'carbon_footprint')
  final CarbonFootprint carbonFootprint;

  MCheck(this.animalWelfare, this.carbonFootprint);

  factory MCheck.fromJson(Map<String, dynamic> json) => _$MCheckFromJson(json);

  Map<String, dynamic> toJson() => _$MCheckToJson(this);
}

@JsonSerializable()
class AnimalWelfare {
  final int rating;

  AnimalWelfare(this.rating);

  factory AnimalWelfare.fromJson(Map<String, dynamic> json) =>
      _$AnimalWelfareFromJson(json);

  Map<String, dynamic> toJson() => _$AnimalWelfareToJson(this);
}

@JsonSerializable()
class CarbonFootprint {
  @JsonKey(name: 'ground_and_sea_cargo')
  final Footprint groundAndSea;

  CarbonFootprint(this.groundAndSea);

  factory CarbonFootprint.fromJson(Map<String, dynamic> json) =>
      _$CarbonFootprintFromJson(json);

  Map<String, dynamic> toJson() => _$CarbonFootprintToJson(this);
}

@JsonSerializable()
class Footprint {
  final int rating;

  Footprint(this.rating);

  factory Footprint.fromJson(Map<String, dynamic> json) =>
      _$FootprintFromJson(json);

  Map<String, dynamic> toJson() => _$FootprintToJson(this);
}
