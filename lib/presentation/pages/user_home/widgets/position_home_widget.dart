import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:yolda_app/domain/common/enums/location_state.dart';
import 'package:yolda_app/domain/common/extensions/position_extension.dart';

class PositionHomeWidget<T> extends StatefulWidget {
  const PositionHomeWidget({
    super.key,
    required this.onLoading,
    required this.onError,
    required this.onSuccess,
    required this.selector,
    required this.locationState,
    required this.controller,
    required this.isUserDetected,
  });

  final Widget Function(BuildContext context) onLoading;
  final Widget Function(BuildContext context, String message) onError;
  final Widget Function(BuildContext context, T value) onSuccess;
  final T Function(Position position) selector;
  final ValueNotifier<LocationState> locationState;
  final Completer<YandexMapController> controller;
  final ValueNotifier<bool> isUserDetected;

  @override
  State<PositionHomeWidget<T>> createState() => _PositionHomeWidgetState<T>();
}

class _PositionHomeWidgetState<T> extends State<PositionHomeWidget<T>> {
  StreamSubscription<Position>? subscription;

  @override
  void initState() {
    widget.locationState.addListener(() async {
      switch (widget.locationState.value) {
        case LocationState.notFixed:
          subscription?.pause();
          break;
        case LocationState.fixed:
          subscription?.pause();
          break;
        case LocationState.tracked:
          if (subscription == null) {
            final controller = await widget.controller.future;
            subscription = Geolocator.getPositionStream(
                locationSettings: AndroidSettings(
              accuracy: LocationAccuracy.bestForNavigation,
              intervalDuration: Duration.zero,
            )).listen(
              (event) async {
                await controller.moveCamera(
                  animation: const MapAnimation(duration: 2),
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: event.toPoint(),
                      zoom: 18,
                      azimuth: event.heading,
                      tilt: 90,
                    ),
                  ),
                );
              },
            );
          } else {
            subscription?.resume();
          }
          break;
      }
    });
    super.initState();
  }

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
          return widget.onError(context, snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return widget.onLoading(context);
        }

        final position = snapshot.data!;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          widget.isUserDetected.value = true;

          if ((position.speed * 3.6).toInt() > 5) {
            widget.locationState.value = LocationState.tracked;
          } else {
            widget.locationState.value = LocationState.fixed;
          }
        });

        return widget.onSuccess(context, widget.selector(position));
      },
    );
  }
}
