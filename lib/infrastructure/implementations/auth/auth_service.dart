import 'package:yolda_app/domain/common/enums/role.dart';
import 'package:yolda_app/domain/repositories/auth_service_repo.dart';
import 'package:yolda_app/infrastructure/firebase/firebase_service.dart';
import 'package:yolda_app/infrastructure/models/auth/local_model.dart';
import 'package:yolda_app/infrastructure/models/auth/user_model.dart';
import 'package:yolda_app/infrastructure/services/db_service.dart';

class AuthServiceImpl extends AuthServiceRepository {
  UserModel? user;
  late final Role? _role;

  static final FirebaseService _service = FirebaseService();
  static DBService dbService = DBService();

  @override
  Role? checkLogged() {
    _role = DBService.isLogged();
    return _role;
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> login({
    required String phoneNumber,
    required String password,
  }) async {}

  @override
  Future<void> register({required UserModel userModel}) async {
    await _service.saveUser(userModel);
    await DBService.saveLogged(
      LocalUserModel(role: userModel.role, phoneNumber: userModel.phoneNumber),
    );
  }

  @override
  Role? get role => _role;
}
