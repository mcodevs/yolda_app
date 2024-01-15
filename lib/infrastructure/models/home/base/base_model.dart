import 'package:json_annotation/json_annotation.dart';
import 'package:yolda_app/infrastructure/models/home/enums/radar_type.dart';
import 'package:yolda_app/infrastructure/models/home/locator/locator.dart';
import 'package:yolda_app/infrastructure/models/home/locator/locator_converter.dart';
import 'package:yolda_app/infrastructure/models/home/radars/multiradar/multiradar.dart';
import 'package:yolda_app/infrastructure/models/home/radars/pillar/pillar.dart';
import 'package:yolda_app/infrastructure/models/home/radars/post/post.dart';
import 'package:yolda_app/infrastructure/models/home/radars/three_legged/three_legged.dart';

abstract class BaseModel with _BaseModelPatternMatcher{
  final String name;
  @LocatorConverter()
  final Locator location;
  final List<int> radius;
  final String icon;
  final double degree;
  final RadarType type;

  const BaseModel({
    required this.name,
    required this.location,
    required this.radius,
    required this.icon,
    required this.degree,
    required this.type,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    final type = $enumDecode(RadarType.types, json['type']);
    return switch (type) {
      RadarType.multiRadar => MultiRadar.fromJson(json),
      RadarType.pillar => Pillar.fromJson(json),
      RadarType.threeLegged => ThreeLegged.fromJson(json),
      RadarType.post => Post.fromJson(json),
    };
  }

  Map<String, dynamic> toJson();

  BaseModel copyWith({
    Locator? location,
    double? degree,
    List<int>? radius,
  });
}

mixin _BaseModelPatternMatcher {
  T map<T>({
    required T Function(MultiRadar value) onMultiRadar,
    required T Function(Pillar value) onPillar,
    required T Function(Post value) onPost,
    required T Function(ThreeLegged value) onThreeLegged,
  });
}
