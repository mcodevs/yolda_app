import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:yolda_app/infrastructure/models/home/core/location/location.dart';
import 'package:yolda_app/infrastructure/models/home/core/location/location_converter.dart';
import 'package:yolda_app/infrastructure/models/home/core/marker_type.dart';

part 'base_model.g.dart';

@JsonSerializable()
class BaseModel {
  final String id;
  final String name;
  final MarkerType type;
  @LocationConverter()
  final Location location;

  static const uuid = Uuid();

  BaseModel({
    String? id,
    required this.name,
    required this.type,
    required this.location,
  }) : id = id ?? uuid.v4();

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);

  BaseModel copyWith({
    String? name,
    MarkerType? type,
    Location? location,
  }) {
    return BaseModel(
      id: id,
      name: name ?? this.name,
      type: type ?? this.type,
      location: location ?? this.location,
    );
  }

  @override
  String toString() {
    return 'BaseModel(id: $id, name: $name, type: $type, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseModel &&
        other.id == id &&
        other.name == name &&
        other.type == type &&
        other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ type.hashCode ^ location.hashCode;
  }
}
