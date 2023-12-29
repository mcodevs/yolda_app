import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yolda_app/infrastructure/models/auth/token.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.loading()) {
    on<AuthEvent>(
      (event, emit) => event.map(
        register: (value) {},
        login: (value) {},
        logOut: (value) {},
      ),
    );
  }
}
