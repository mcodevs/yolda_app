import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:yolda_app/infrastructure/models/home/locator/locator.dart';

extension PointExtension on Point {
  Locator toLocator() => Locator(
        latitude: latitude,
        longitude: longitude,
      );
}
