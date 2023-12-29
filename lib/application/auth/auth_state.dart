part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;
  const factory AuthState.success(Token token) = _Success;
  const factory AuthState.error(String errorMessage) = _Error;
}
