part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.register({
    required String nameAndSurname,
    required String carNumber,
    required String phoneNumber,
    required String password,
  }) = _Register;

  const factory AuthEvent.login({
    required String phoneNumber,
    required String password,
  }) = _Login;

  const factory AuthEvent.logOut() = _LogOut;
}
