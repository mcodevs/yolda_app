import 'package:observe_internet_connectivity/observe_internet_connectivity.dart';

class ConnectivityService {
  static final InternetConnectivity _connectivity = InternetConnectivity();

  static bool? _hasConnection;

  static bool get hasConnection => _hasConnection ?? false;

  static Future<bool> checkInternet() async {
    _hasConnection = await _connectivity.hasInternetConnection;
    return _hasConnection ?? false;
  }

  static Stream<bool> streamConnectivity =
      _connectivity.observeInternetConnection.asBroadcastStream();
}
