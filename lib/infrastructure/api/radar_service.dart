import 'package:yolda_app/infrastructure/models/home/radar/radar.dart';
import 'package:yolda_app/infrastructure/repositories/radar_service_repo.dart';

class RadarService extends RadarServiceRepo {
  @override
  Future<void> createRadar({required Radar radar}) {
    // TODO: implement createRadar
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRadar({required String id}) {
    // TODO: implement deleteRadar
    throw UnimplementedError();
  }

  @override
  Future<List<Radar>> readAllRadars({String? territory}) {
    // TODO: implement readAllRadars
    throw UnimplementedError();
  }

  @override
  Future<Radar> readRadar({required String id}) {
    // TODO: implement readRadar
    throw UnimplementedError();
  }

  @override
  Future<void> updateRadar({required Radar newRadar}) {
    // TODO: implement updateRadar
    throw UnimplementedError();
  }
 }
