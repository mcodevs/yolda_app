part of 'marker_bloc.dart';

@freezed
class MarkerState with _$MarkerState {
  const factory MarkerState.loading() = _Loading;
  const factory MarkerState.success() = _Success;
  const factory MarkerState.error() = _Error;
}
