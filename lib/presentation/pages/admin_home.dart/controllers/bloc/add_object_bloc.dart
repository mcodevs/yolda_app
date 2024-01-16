import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yolda_app/infrastructure/models/home/base/base_model.dart';

part 'add_object_event.dart';
part 'add_object_state.dart';
part 'add_object_bloc.freezed.dart';

class AddObjectBloc extends Bloc<AddObjectEvent, AddObjectState> {
  AddObjectBloc() : super(const AddObjectState.focusRemoved()) {
    on<AddObjectEvent>(
      (event, emit) => event.map(
        waitForAdd: (value) => _onWaitForAdd(value, emit),
        changeObjectType: (value) => _onChangeObjectType(value, emit),
        confirmObject: (value) => _onConfirmObject(value, emit),
        exit: (value) => _onExit(value, emit),
      ),
    );
  }

  void _onWaitForAdd(_WaitForAdd value, Emitter<AddObjectState> emit) {
    emit(const AddObjectState.initial());
  }

  void _onChangeObjectType(
    _ChangeObjectType value,
    Emitter<AddObjectState> emit,
  ) {
    emit(
      AddObjectState.objectChanged(value.object),
    );
  }

  void _onConfirmObject(_ConfirmObject value, Emitter<AddObjectState> emit) {}

  void _onExit(_Exit value, Emitter<AddObjectState> emit) {
    emit(const AddObjectState.focusRemoved());
  }
}
