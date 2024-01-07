import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yolda_app/infrastructure/firebase/firebase_service.dart';
import 'package:yolda_app/infrastructure/models/home/core/base/base_model.dart';
import 'package:yolda_app/infrastructure/services/geofencing_service.dart';

part 'user_home_event.dart';
part 'user_home_state.dart';
part 'user_home_bloc.freezed.dart';

class UserHomeBloc extends Bloc<UserHomeEvent, UserHomeState> {
  UserHomeBloc() : super(const UserHomeState.loading()) {
    on<UserHomeEvent>(
      (event, emit) {
        Geofencing.getRadars();
        Geofencing.listenRadar(
          onInside: (radar, distance) {},
          onOutside: () {},
          onOtherRadarDetected: (radar, distance) {},
        );
        event.map(
          getAllMarkers: (value) => _getAllMarkers(value, emit),
          readMarker: (value) {},
          createMarker: (value) => _createMarker(value, emit),
          updateMarker: (value) {},
          deleteMarker: (value) {},
        );
      },
    );
  }

  Future<void> _createMarker(
    _RemoveMarker value,
    Emitter<UserHomeState> emit,
  ) async {
    try {
      await FirebaseService.radarPath.doc(value.radar.id).set(value.radar);
      Geofencing.addRadar(value.radar);
      emit(const UserHomeState.success());
    } on Exception catch (e) {
      emit(UserHomeState.error(e.toString()));
    }
  }

  Future<void> _getAllMarkers(
    _GetAllMarkers value,
    Emitter<UserHomeState> emit,
  ) async {
    try {
      Geofencing.start(value.radars);
    } catch (e) {
      emit(UserHomeState.error(e.toString()));
    }
  }
}
