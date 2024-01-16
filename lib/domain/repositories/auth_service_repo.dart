import 'package:yolda_app/domain/common/enums/role.dart';
import 'package:yolda_app/infrastructure/models/auth/user_model.dart';

abstract class AuthServiceRepository {
  Role? get role;

  /// Handle login
  Future<void> login({
    required String phoneNumber,
    required String password,
  });

  /// Handle register
  Future<void> register({required UserModel userModel});

  /// Handle log out
  Future<void> logOut();

  // UserModel? get currentUser;

  // /// Check is logged
  // Future<Role?> checkLogged();
}
