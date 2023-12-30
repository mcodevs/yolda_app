import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yolda_app/domain/common/my_marker/my_marker.dart';
import 'package:yolda_app/infrastructure/models/home/radar/radar.dart';
import 'package:yolda_app/domain/radar_service/radar_service_repo.dart';
import 'package:yolda_app/infrastructure/services/geofencing_service.dart';
import 'package:yolda_app/infrastructure/services/log_service.dart';

part 'marker_event.dart';
part 'marker_state.dart';
part 'marker_bloc.freezed.dart';

class MarkerBloc extends Bloc<MarkerEvent, MarkerState> {
  final RadarServiceRepo _repository;
  MarkerBloc({required RadarServiceRepo repository})
      : _repository = repository,
        super(const MarkerState.loading()) {
    MyMarker.onMarkerTapped = onTapForMarkers;
    on<MarkerEvent>(
      (event, emit) => event.map(
        getAllMarkers: (value) => _onGetAllMarkers(value, emit),
        readMarker: (value) => _onReadMarker(value, emit),
        createMarker: (value) => _onCreateMarker(value, emit),
        updateMarker: (value) => _onUpdateMarker(value, emit),
        deleteMarker: (value) => _onDeleteMarker(value, emit),
      ),
    );
  }

  void onTapForMarkers(MyMarker marker) {}

  Future<List<Radar>> getRadarsFromNetwork({String? territory}) async {
    return await _repository.readAllRadars(territory: territory);
  }

  Set<MyMarker> convertToMarkers(List<Radar> radars) {
    return radars.map((e) => e.toMarker()).toSet();
  }

  Future<void> _onGetAllMarkers(
    _GetAllMarkers value,
    Emitter<MarkerState> emit,
  ) async {
    Geofencing.close();
    final radars = await getRadarsFromNetwork(territory: value.territory);
    final markers = convertToMarkers(radars);
    Geofencing.getRadars(radars);
    Geofencing.listenRadar(
      onInside: (radar, distance) {
        LogService.i("Radar ichidasan");
      },
      onOutside: () {
        LogService.e("Radardan chiqding");
      },
      onOtherRadarDetected: (radar, distance) {
        LogService.d("Boshqa radar topildi");
      },
    );
    emit(MarkerState.success(markers.toSet()));
  }

  void _onReadMarker(_AddMarker value, Emitter<MarkerState> emit) {}

  Future<void> _onCreateMarker(
    _RemoveMarker value,
    Emitter<MarkerState> emit,
  ) async {
    await _repository.createRadar(radar: value.radar);
    Geofencing.addRadar(value.radar);
    final radars = await getRadarsFromNetwork();
    final markers = convertToMarkers(radars);
    emit(MarkerState.success(markers));
  }

  void _onUpdateMarker(_UpdateMarker value, Emitter<MarkerState> emit) {}

  void _onDeleteMarker(_DeleteMarker value, Emitter<MarkerState> emit) {}
}
