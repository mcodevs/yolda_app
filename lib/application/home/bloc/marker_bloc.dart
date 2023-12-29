import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yolda_app/infrastructure/models/home/radar/radar.dart';

part 'marker_event.dart';
part 'marker_state.dart';
part 'marker_bloc.freezed.dart';

class MarkerBloc extends Bloc<MarkerEvent, MarkerState> {
  MarkerBloc() : super(const MarkerState.loading()) {
    on<MarkerEvent>((event, emit) => event.map(
          getAllMarkers: (value) {},
          addMarker: (value) {
            value.radar.map(
              onOnlyLimit: (value) {},
              onLimitAndRadar: (value) {},
            );
          },
          removeMarker: (value) {},
          updateMarker: (value) {},
          deleteMarker: (value) {},
        ));
  }
}
