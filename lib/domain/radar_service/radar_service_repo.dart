import 'package:yolda_app/infrastructure/models/home/radar/radar.dart';

abstract class RadarServiceRepo {
  Future<List<Radar>> readAllRadars({String? territory});
  Future<void> createRadar({required Radar radar});
  Future<Radar> readRadar({required String id});
  Future<void> updateRadar({required Radar newRadar});
  Future<void> deleteRadar({required String id});
}
