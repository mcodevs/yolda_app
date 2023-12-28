import 'package:observe_internet_connectivity/observe_internet_connectivity.dart';

class ConnectivityService {
  static final InternetConnectivity _connectivity = InternetConnectivity();

  static bool? _hasConnection;

  static bool get hasConnection => _hasConnection ?? false;

  static Future<void> checkInternet() async {
    _hasConnection = await _connectivity.hasInternetConnection;
  }

  static Stream<bool> streamConnectivity() =>
      _connectivity.observeInternetConnection;
}
