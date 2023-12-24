import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  static late final String _appVersion;
  static String get appVersion => _appVersion;

  static Future<void> initialize() async {
    final service = FirebaseRemoteConfig.instance;

    await service.ensureInitialized();

    await service.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ),
    );

    await service.fetchAndActivate();

    _appVersion = service.getString("app_version");
  }
}

