import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:yolda_app/infrastructure/models/home/radar/radar.dart';
import 'package:yolda_app/infrastructure/services/db_service.dart';

class FakeDBService {
  static final SharedPreferences _storage = DBService.storage;
  static const _allRadars = "radars";

  Future<void> _setRadars(List<Radar> radars) => _storage.setStringList(
        _allRadars,
        radars.map((e) => jsonEncode(e)).toList(),
      );

  Future<void> createRadar({required Radar radar}) async {
    final radars = await readAllRadars();
    radars.add(radar);
    await _setRadars(radars);
  }

  Future<List<Radar>> readAllRadars({String? territory}) async {
    List<String> stringRadars = _storage.getStringList(_allRadars) ?? [];
    final radars =
        stringRadars.map((e) => Radar.fromJson(jsonDecode(e))).toList();
    if (territory == null) {
      return radars;
    } else {
      return radars.where((element) => element.territory == territory).toList();
    }
  }

  Future<Radar> readRadar({required String id}) async {
    final radars = await readAllRadars();
    return radars.firstWhere((element) => element.id == id);
  }

  Future<void> updateRadar({required Radar newRadar}) async {
    List<Radar> radars = await readAllRadars();
    int index = radars.indexOf(newRadar);
    radars[index] = newRadar;
    await _setRadars(radars);
  }

  Future<void> deleteRadar({required String id}) async {
    final radars = await readAllRadars();
    radars.removeWhere((element) => element.id == id);
    await _setRadars(radars);
  }
}
