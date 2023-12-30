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
          getAllMarkers: (value) => _onGetAllMarkers(value, emit),
          addMarker: (value) => _onAddMarker(value, emit),
          removeMarker: (value) => _onRemoveMarker(value, emit),
          updateMarker: (value) => _onUpdateMarker(value, emit),
          deleteMarker: (value) => _onDeleteMarker(value, emit),
        ));
  }

  void _onGetAllMarkers(_GetAllMarkers value, Emitter<MarkerState> emit) {
    
  }

  void _onAddMarker(_AddMarker value, Emitter<MarkerState> emit) {}

  void _onRemoveMarker(_RemoveMarker value, Emitter<MarkerState> emit) {}

  void _onUpdateMarker(_UpdateMarker value, Emitter<MarkerState> emit) {}

  void _onDeleteMarker(_DeleteMarker value, Emitter<MarkerState> emit) {}
}
