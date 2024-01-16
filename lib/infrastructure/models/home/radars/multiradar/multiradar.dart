import 'package:json_annotation/json_annotation.dart';
import 'package:yolda_app/infrastructure/constants/app_icons.dart';
import 'package:yolda_app/infrastructure/models/home/base/base_model.dart';
import 'package:yolda_app/infrastructure/models/home/enums/radar_type.dart';
import 'package:yolda_app/infrastructure/models/home/locator/locator.dart';
import 'package:yolda_app/infrastructure/models/home/locator/locator_converter.dart';
import 'package:yolda_app/infrastructure/models/home/radars/pillar/pillar.dart';
import 'package:yolda_app/infrastructure/models/home/radars/post/post.dart';
import 'package:yolda_app/infrastructure/models/home/radars/three_legged/three_legged.dart';

part 'multiradar.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class MultiRadar extends BaseModel {
  final int speedLimit;
  const MultiRadar({
    required super.location,
    required super.degree,
    required this.speedLimit,
    List<int>? radius,
    String? name,
    String? icon,
    RadarType? type,
  }) : super(
          name: name ?? "MultiRadar",
          radius: radius ?? const [600, 300, 150, 50],
          icon: icon ?? AppIcons.camera1,
          type: type ?? RadarType.multiRadar,
        );

  @override
  BaseModel copyWith({
    Locator? location,
    double? degree,
    List<int>? radius,
    RadarType? type,
    int? speedLimit,
  }) {
    return MultiRadar(
      location: location ?? this.location,
      radius: radius ?? this.radius,
      degree: degree ?? this.degree,
      type: type ?? this.type,
      speedLimit: speedLimit ?? this.speedLimit,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$MultiRadarToJson(this);

  factory MultiRadar.fromJson(Map<String, dynamic> json) =>
      _$MultiRadarFromJson(json);

  @override
  T map<T>({
    required T Function(MultiRadar value) onMultiRadar,
    required T Function(Pillar value) onPillar,
    required T Function(Post value) onPost,
    required T Function(ThreeLegged value) onThreeLegged,
  }) =>
      onMultiRadar(this);
}
