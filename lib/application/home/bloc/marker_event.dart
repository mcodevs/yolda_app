part of 'marker_bloc.dart';

@freezed
class MarkerEvent with _$MarkerEvent {
  const factory MarkerEvent.getAllMarkers({String? territory}) = _GetAllMarkers;
  
  const factory MarkerEvent.readMarker({
    required Radar radar,
  }) = _AddMarker;

  const factory MarkerEvent.createMarker({
    required Radar radar,
  }) = _RemoveMarker;

  const factory MarkerEvent.updateMarker({
    required Radar radar,
  }) = _UpdateMarker;

  const factory MarkerEvent.deleteMarker({
    required String id,
  }) = _DeleteMarker;
}
