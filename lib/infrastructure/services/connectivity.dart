import 'package:observe_internet_connectivity/observe_internet_connectivity.dart';

class ConnectivityService {
  static Stream<bool> streamConnectivity =
      InternetConnectivity().observeInternetConnection.asBroadcastStream();
}
