import 'package:json_annotation/json_annotation.dart';
import 'package:yolda_app/infrastructure/constants/app_icons.dart';
import 'package:yolda_app/infrastructure/models/home/base/base_model.dart';
import 'package:yolda_app/infrastructure/models/home/enums/radar_type.dart';
import 'package:yolda_app/infrastructure/models/home/locator/locator.dart';
import 'package:yolda_app/infrastructure/models/home/locator/locator_converter.dart';
import 'package:yolda_app/infrastructure/models/home/radars/multiradar/multiradar.dart';
import 'package:yolda_app/infrastructure/models/home/radars/pillar/pillar.dart';
import 'package:yolda_app/infrastructure/models/home/radars/three_legged/three_legged.dart';

part 'post.g.dart';

@JsonSerializable()
class Post extends BaseModel {
  Post({
    required super.location,
    required super.degree,
    required super.type,
    List<int>? radius,
    String? name,
    String? icon,
  }) : super(
          name: name ?? "Post",
          icon: icon ?? AppIcons.camera4,
          radius: radius ?? const [1000, 500, 200],
        );

  @override
  BaseModel copyWith({
    Locator? location,
    double? degree,
    List<int>? radius,
    RadarType? type,
  }) =>
      Post(
        location: location ?? this.location,
        degree: degree ?? this.degree,
        type: type ?? this.type,
        radius: radius ?? this.radius,
      );

  @override
  Map<String, dynamic> toJson() => _$PostToJson(this);

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  @override
  T map<T>({
    required T Function(MultiRadar value) onMultiRadar,
    required T Function(Pillar value) onPillar,
    required T Function(Post value) onPost,
    required T Function(ThreeLegged value) onThreeLegged,
  }) => onPost(this);
}
