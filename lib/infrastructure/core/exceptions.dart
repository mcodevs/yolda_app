
class UserNotFount implements Exception {
  final String message;

  UserNotFount(this.message);
}

class WrongPasswordOrActive implements Exception {
  final String message;

  WrongPasswordOrActive(this.message);
}