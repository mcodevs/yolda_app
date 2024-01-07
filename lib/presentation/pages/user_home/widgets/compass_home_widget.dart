import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class CompassHomeWidget extends StatelessWidget {
  const CompassHomeWidget({
    super.key,
    required this.onLoading,
    required this.onError,
    required this.onSuccess,
    required this.onAccuracyLow,
  });
  final Widget Function(BuildContext context) onLoading;
  final Widget Function(BuildContext context, String errorMessage) onError;
  final Widget Function(BuildContext context, double heading) onSuccess;
  final VoidCallback onAccuracyLow;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return onError(context, snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return onLoading(context);
        }
        final data = snapshot.data!;
        if (data.accuracy! < 10) {
          onAccuracyLow.call();
        }
        final heading =
            data.heading!.isNegative ? 360 + data.heading! : data.heading!;
        return onSuccess(context, heading);
      },
    );
  }
}
