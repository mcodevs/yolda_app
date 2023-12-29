part of 'marker_bloc.dart';

@freezed
class MarkerEvent with _$MarkerEvent {
  const factory MarkerEvent.getAllMarkers() = _GetAllMarkers;
  
  const factory MarkerEvent.addMarker({
    required Radar radar,
  }) = _AddMarker;

  const factory MarkerEvent.removeMarker({
    required Radar radar,
  }) = _RemoveMarker;

  const factory MarkerEvent.updateMarker({
    required Radar radar,
  }) = _UpdateMarker;

  const factory MarkerEvent.deleteMarker({
    required Radar radar,
  }) = _DeleteMarker;
}
