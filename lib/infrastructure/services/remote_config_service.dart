import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';

class RemoteConfigService {
  static late String _appVersion;
  static String get appVersion => _appVersion;

  static final service = FirebaseRemoteConfig.instance;
  static late final PackageInfo package;

  static Future<void> initialize() async {
    await service.ensureInitialized();

    await service.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ),
    );
    package = await PackageInfo.fromPlatform();
    await checkVersion();
  }

  static Future<void> checkVersion() async {
    try {
      await service.fetchAndActivate();
      _appVersion = service.getString("app_version");
    } catch (e) {
      _appVersion = package.version;
    }
  }
}
