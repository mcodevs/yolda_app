import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:yolda_app/domain/common/my_marker/my_marker.dart';

extension ToCircle on Set<MyMarker> {
  Set<CircleMapObject> toCircles() {
    return map((e) => e.toCircles())
        .expand((element) => element)
        .toList()
        .toSet();
  }
}