import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yolda_app/firebase_options.dart';
import 'package:yolda_app/infrastructure/services/connectivity.dart';
import 'package:yolda_app/infrastructure/services/db_service.dart';
import 'package:yolda_app/infrastructure/services/remote_config_service.dart';

class AppInit {
  static Future<void> initializeApp() async {
    /// Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await EasyLocalization.ensureInitialized();
    await DBService.initialize();
    await RemoteConfigService.initialize();
    await ConnectivityService.checkInternet();
  }
}
