part of 'add_object_bloc.dart';

@freezed
class AddObjectEvent with _$AddObjectEvent {
  const factory AddObjectEvent.waitForAdd() = _WaitForAdd;
  const factory AddObjectEvent.changeObjectType(BaseModel object) = _ChangeObjectType;
  const factory AddObjectEvent.confirmObject(BaseModel object) = _ConfirmObject;
  const factory AddObjectEvent.exit() = _Exit;
}