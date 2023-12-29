import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@immutable
@freezed
class Token with _$Token {
  const factory Token({
    required String accessToken,
    required String refreshToken,
    required bool isAdmin,
  }) =
      _Token;

  factory Token.fromJson(Map<String, Object?> json) => _$TokenFromJson(json);
}
