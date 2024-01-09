import 'package:yolda_app/domain/common/enums/role.dart';
import 'package:yolda_app/domain/repositories/auth_service_repo.dart';
import 'package:yolda_app/infrastructure/core/exceptions.dart';
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
  Future<void> logOut() async {
    await FirebaseService.logOut(currentUser!.phoneNumber);
    await DBService.removeUser();
    currentUser = null;
  }

  @override
  Future<void> login({
    required String phoneNumber,
    required String password,
  }) async {
    currentUser = await FirebaseService.getOrChek(phoneNumber);
    if (currentUser == null) {
      throw UserNotFount("User Not Found");
    } else {
      if (currentUser!.isActive || currentUser!.password != password) {
        throw WrongPasswordOrActive("Password Xato");
      }

      await DBService.saveLogged(
        LocalUserModel(
          role: currentUser!.role,
          phoneNumber: currentUser!.phoneNumber,
        ),
      );
    }
  }

  @override
  Future<void> register({required UserModel userModel}) async {
    await _service.saveUser(userModel);
    currentUser = userModel;
    await DBService.saveLogged(
      LocalUserModel(role: userModel.role, phoneNumber: userModel.phoneNumber),
    );
  }

  @override
  Role? get role => _role;

  @override
  UserModel? currentUser;
}
