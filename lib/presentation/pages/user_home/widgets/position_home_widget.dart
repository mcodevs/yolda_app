import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class PositionHomeWidget<T> extends StatelessWidget {
  const PositionHomeWidget({
    super.key,
    required this.onLoading,
    required this.onError,
    required this.onSuccess,
    required this.selector,
  });

  final Widget Function(BuildContext context) onLoading;
  final Widget Function(BuildContext context, String message) onError;
  final Widget Function(BuildContext context, T value) onSuccess;
  final T Function(Position position) selector;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Geolocator.getPositionStream(
        locationSettings: AndroidSettings(
          intervalDuration: Duration.zero,
          accuracy: LocationAccuracy.bestForNavigation,
        ),
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return onError(context, snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return onLoading(context);
        }

        return onSuccess(context, selector(snapshot.data!));
      },
    );
  }
}
