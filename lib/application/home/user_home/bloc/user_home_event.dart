part of 'user_home_bloc.dart';

@freezed
class UserHomeEvent with _$UserHomeEvent {
  const factory UserHomeEvent.initial() = _Initial;
  
  const factory UserHomeEvent.getAllMarkers({
    required List<BaseModel> radars,
  }) = _GetAllMarkers;

  const factory UserHomeEvent.readMarker({
    required BaseModel radar,
  }) = _AddMarker;

  const factory UserHomeEvent.createMarker({
    required BaseModel radar,
  }) = _RemoveMarker;

  const factory UserHomeEvent.updateMarker({
    required BaseModel radar,
  }) = _UpdateMarker;

  const factory UserHomeEvent.deleteMarker({
    required String id,
  }) = _DeleteMarker;
}
