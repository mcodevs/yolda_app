import 'package:yolda_app/domain/common/enums/role.dart';

abstract class AuthServiceRepository {
  Role? get role;

  /// Handle login
  Future<void> login({
    required String phoneNumber,
    required String password,
  });

  /// Handle register
  Future<void> register({
    required String name,
    required String carNumber,
    required String phoneNumber,
    required String password,
  });

  /// Handle log out
  Future<void> logOut();

  /// Check is logged
  Role? checkLogged();
}
