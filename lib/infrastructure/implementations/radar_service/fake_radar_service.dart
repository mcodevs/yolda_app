import 'package:yolda_app/infrastructure/models/home/radar/radar.dart';
import 'package:yolda_app/domain/radar_service/radar_service_repo.dart';
import 'package:yolda_app/infrastructure/services/mock/fake_db_service.dart';

class FakeRadarService extends RadarServiceRepo {
  static final FakeDBService _service = FakeDBService();

  @override
  Future<void> createRadar({required Radar radar}) =>
      _service.createRadar(radar: radar);

  @override
  Future<void> deleteRadar({required String id}) async {
    await _service.deleteRadar(id: id);
  }

  @override
  Future<List<Radar>> readAllRadars({String? territory}) {
    return _service.readAllRadars(territory: territory);
  }

  @override
  Future<Radar> readRadar({required String id}) {
    return _service.readRadar(id: id);
  }

  @override
  Future<void> updateRadar({required Radar newRadar}) async {
    await _service.updateRadar(newRadar: newRadar);
  }
}
