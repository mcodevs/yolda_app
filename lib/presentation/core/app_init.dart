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
    print("1");
    await DBService.initialize();
    print("2");
    await RemoteConfigService.initialize();
    print("3");
    await ConnectivityService.checkInternet();
    print("4");
  }
}
