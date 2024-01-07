import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:yolda_app/infrastructure/models/home/core/base/base_model.dart';

extension ListExtension on List<BaseModel> {
  List<PlacemarkMapObject> toMarkers() => map((e) => e.toMarker()).toList();
}
