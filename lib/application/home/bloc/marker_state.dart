part of 'marker_bloc.dart';

@freezed
class MarkerState with _$MarkerState {
  const factory MarkerState.loading() = _Loading;
  const factory MarkerState.success(Set<MyMarker> markers) = _Success;
  const factory MarkerState.error(String errorMessage) = _Error;
}
