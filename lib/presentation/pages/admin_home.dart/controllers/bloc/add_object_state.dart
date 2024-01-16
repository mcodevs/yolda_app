part of 'add_object_bloc.dart';

@freezed
class AddObjectState with _$AddObjectState {
  const factory AddObjectState.initial() = _Initial;
  const factory AddObjectState.objectChanged(BaseModel object) = _ObjectChanged;
  const factory AddObjectState.focusRemoved() = _FocusRemoved;
}
