import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yolda_app/domain/common/my_marker/my_marker.dart';

extension ToCircle on Set<MyMarker> {
  Set<Circle> toCircles() {
    return map((e) => e.toCircles())
        .expand((element) => element)
        .toList()
        .toSet();
  }
}