import 'package:yolda_app/domain/common/enums/role.dart';
import 'package:yolda_app/domain/repositories/auth_service_repo.dart';
import 'package:yolda_app/infrastructure/models/auth/user_model.dart';

class AuthServiceImpl extends AuthServiceRepository {
  UserModel? user;

  @override
  Future<Role?> checkLogged() {
    // TODO: implement checkLogged
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> login({required String phoneNumber, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> register(
      {required String name,
      required String carNumber,
      required String phoneNumber,
      required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  // TODO: implement role
  Role? get role => throw UnimplementedError();
}
