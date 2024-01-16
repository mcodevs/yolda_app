import 'package:yolda_app/domain/common/enums/role.dart';
import 'package:yolda_app/domain/repositories/auth_service_repo.dart';
import 'package:yolda_app/infrastructure/core/exceptions.dart';
import 'package:yolda_app/infrastructure/firebase/firebase_service.dart';
import 'package:yolda_app/infrastructure/models/auth/user_model.dart';
import 'package:yolda_app/infrastructure/services/db_service.dart';

class AuthServiceImpl extends AuthServiceRepository {
  static final FirebaseService _service = FirebaseService();

  static Future<Role?> checkLogged() async {
    final phoneNumber = DBService.isLogged();
    if (phoneNumber == null) return null;
    final user = await FirebaseService.getOrChek(phoneNumber);
    if (user == null) {
      await DBService.removeUser();
      return null;
    }
    currentUser = user;
    return currentUser!.role;
  }

  @override
  Future<void> logOut() async {
    await FirebaseService.changeActivity(currentUser!.phoneNumber, false);
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

      await DBService.saveLogged(phoneNumber);
      FirebaseService.changeActivity(phoneNumber, true);
    }
  }

  @override
  Future<void> register({required UserModel userModel}) async {
    await _service.saveUser(userModel);
    currentUser = userModel;
    await DBService.saveLogged(userModel.phoneNumber);
  }

  @override
  Role? get role => currentUser?.role;

  static UserModel? currentUser;
}
