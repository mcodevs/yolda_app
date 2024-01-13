import 'package:geofence_service/geofence_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yolda_app/infrastructure/models/home/base/base_model.dart';
import 'package:yolda_app/infrastructure/services/log_service.dart';
import 'package:yolda_app/infrastructure/services/tts_service.dart';
// import 'package:geolocator/geolocator.dart';

class Geofencing {
  static late final GeofenceService _service;

  static String? _currentRadar;

  static void initialize() => _service = GeofenceService.instance.setup(
        interval: 200,
        accuracy: 100,
        loiteringDelayMs: 600,
        statusChangeDelayMs: 1000,
        useActivityRecognition: true,
        allowMockLocations: false,
        printDevLog: true,
        geofenceRadiusSortType: GeofenceRadiusSortType.DESC,
      );

  static Future<void> getRadars() async {
    await _service.start();
    LogService.e("${_service.isRunningService}");
  }

  // static updateRadars(List<BaseModel> radars) {
  //   _service.clearGeofenceList();
  //   _service.addGeofenceList(radars.toGeofence());
  // }

  static void close() {
    _service.clearAllListeners();
    clear();
  }

  static void clear() {
    _service.clearGeofenceList();
  }

  static void listenRadar({
    required void Function(BaseModel radar, int distance) onInside,
    required void Function() onOutside,
    required void Function(BaseModel radar, int distance) onOtherRadarDetected,
  }) {
    _service.addGeofenceStatusChangeListener((
      Geofence geofence,
      GeofenceRadius geofenceRadius,
      GeofenceStatus geofenceStatus,
      Location location,
    ) async {
      final isInside = _isInside(
        radar: geofence,
        userLocation: location,
      );

      if (geofenceStatus == GeofenceStatus.ENTER &&
          isInside &&
          ((_currentRadar == null) || (_currentRadar == geofence.id))) {
        await TTSService.speakMeter(geofenceRadius.length.toInt());
        LogService.e("$_currentRadar");
        if (geofenceRadius.length == 150) {
          TTSService.beepSound();
        }
        _currentRadar = geofence.id;
        onInside(geofence.data, geofenceRadius.length.toInt());
      } else if (geofenceStatus == GeofenceStatus.ENTER &&
          isInside &&
          ((_currentRadar != null) || (_currentRadar != geofence.id))) {
        TTSService.speakOtherRadar();
        onOtherRadarDetected(geofence.data, geofenceRadius.length.toInt());
      } else if (geofenceStatus == GeofenceStatus.EXIT &&
          _currentRadar == geofence.id) {
        _currentRadar = null;
        TTSService.speakWhenOutside();
        onOutside();
      }
    });
  }

  static void addRadar(BaseModel radar) {
    // _service.addGeofence(radar.toGeofence());
  }

  static void removeRadar(String id) {
    _service.removeGeofenceById(id);
  }

  static void updateRadar(BaseModel radar) {
    // removeRadar(radar.id);
    // addRadar(radar);
  }

  static bool _isInside({
    required Location userLocation,
    required Geofence radar,
  }) {
    var bearing = Geolocator.bearingBetween(
      userLocation.latitude,
      userLocation.longitude,
      radar.latitude,
      radar.longitude,
    );

    bearing = bearing.isNegative ? bearing + 360 : bearing;

    return (bearing - userLocation.heading).abs() <= 30;
  }

  static Future<void> start(List<BaseModel> radars) async {
    _service.clearGeofenceList();
    await Future.delayed(const Duration(seconds: 3));
    // _service.addGeofenceList(radars.map((e) => e.toGeofence()).toList());
  }
}
