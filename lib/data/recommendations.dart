import 'package:json_annotation/json_annotation.dart';

part 'recommendations.g.dart';

@JsonSerializable()
class Recommendations {
  final List<String> good;
  final List<String> bad;

  Recommendations(this.good, this.bad);

  factory Recommendations.fromJson(Map<String, dynamic> json) =>
      _$RecommendationsFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendationsToJson(this);
}
