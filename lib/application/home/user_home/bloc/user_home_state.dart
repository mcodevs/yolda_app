part of 'user_home_bloc.dart';

@freezed
class UserHomeState with _$UserHomeState {
  const factory UserHomeState.loading() = _Loading;
  const factory UserHomeState.success() = _Success;
  const factory UserHomeState.error(String errorMessage) = _Error;
}
