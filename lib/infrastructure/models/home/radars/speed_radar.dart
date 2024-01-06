import 'package:json_annotation/json_annotation.dart';
import 'package:yolda_app/infrastructure/models/home/core/base/base_model.dart';
import 'package:yolda_app/infrastructure/models/home/core/location/location_converter.dart';
import 'package:yolda_app/infrastructure/models/home/core/marker_type.dart';

part 'speed_radar.g.dart';

@JsonSerializable()
class SpeedRadar extends BaseModel {
  SpeedRadar({
    super.id,
    required super.name,
    required super.type,
    required super.location,
  });
}
