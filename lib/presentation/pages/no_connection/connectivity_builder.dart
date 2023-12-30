import 'package:flutter/material.dart';
import 'package:yolda_app/infrastructure/services/connectivity.dart';
import 'package:yolda_app/presentation/pages/no_connection/no_connection_page.dart';

class ConnectivityBuilder extends StatelessWidget {
  const ConnectivityBuilder({
    super.key,
    required this.onConnected,
    this.onNotConnected,
  });

  final Widget Function(BuildContext context) onConnected;
  final Widget Function(BuildContext context)? onNotConnected;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: ConnectivityService.streamConnectivity,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!) {
            return onConnected(context);
          } else {
            return onNotConnected != null
                ? onNotConnected!(context)
                : const NoConnectionPage();
          }
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
