import 'package:json_annotation/json_annotation.dart';
import 'package:yolda_app/infrastructure/constants/app_icons.dart';
import 'package:yolda_app/infrastructure/models/home/base/base_model.dart';
import 'package:yolda_app/infrastructure/models/home/enums/radar_type.dart';
import 'package:yolda_app/infrastructure/models/home/locator/locator.dart';
import 'package:yolda_app/infrastructure/models/home/locator/locator_converter.dart';
import 'package:yolda_app/infrastructure/models/home/radars/multiradar/multiradar.dart';
import 'package:yolda_app/infrastructure/models/home/radars/pillar/pillar.dart';
import 'package:yolda_app/infrastructure/models/home/radars/post/post.dart';

part 'three_legged.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class ThreeLegged extends BaseModel {
  final int speedLimit;
  ThreeLegged({
    required super.location,
    required super.degree,
    required this.speedLimit,
    List<int>? radius,
    String? name,
    String? icon,
    RadarType? type,
  }) : super(
          name: name ?? "Uch oyoqli radar",
          radius: radius ?? const [600, 400, 200, 100],
          icon: icon ?? AppIcons.camera3,
          type: type ?? RadarType.threeLegged,
        );

  @override
  BaseModel copyWith({
    Locator? location,
    double? degree,
    List<int>? radius,
    RadarType? type,
    int? speedLimit,
  }) =>
      ThreeLegged(
        location: location ?? this.location,
        degree: degree ?? this.degree,
        type: type ?? this.type,
        speedLimit: speedLimit ?? this.speedLimit,
        radius: radius ?? this.radius,
      );

  @override
  Map<String, dynamic> toJson() => _$ThreeLeggedToJson(this);

  factory ThreeLegged.fromJson(Map<String, dynamic> json) =>
      _$ThreeLeggedFromJson(json);

  @override
  T map<T>({
    required T Function(MultiRadar value) onMultiRadar,
    required T Function(Pillar value) onPillar,
    required T Function(Post value) onPost,
    required T Function(ThreeLegged value) onThreeLegged,
  }) =>
      onThreeLegged(this);
}
