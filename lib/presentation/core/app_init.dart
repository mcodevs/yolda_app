import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yolda_app/firebase_options.dart';
import 'package:yolda_app/infrastructure/services/db_service.dart';
import 'package:yolda_app/infrastructure/services/geofencing_service.dart';
import 'package:yolda_app/infrastructure/services/log_service.dart';
import 'package:yolda_app/infrastructure/services/remote_config_service.dart';
import 'package:yolda_app/infrastructure/services/tts_service.dart';

class AppInit {
  static Future<void> initializeApp() async {
    /// Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await Future.wait([
      DBService.initialize(),
      EasyLocalization.ensureInitialized(),
      RemoteConfigService.initialize(),
      TTSService.initialize(),
    ]);
    await Geolocator.getCurrentPosition();
    Geofencing.initialize();
    await Geofencing.getRadars();

    // DBService.storage.clear(); //  Uncomment this line for clear local storage
    LogService.create;

    LogService.i("App init success!");
  }
}
