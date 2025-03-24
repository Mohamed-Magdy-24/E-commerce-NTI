import 'package:ntigradproject/feature/auth/login/data/model/login_model.dart';

class UserService {
  UserService._();
  static UserService? _instance;
  factory UserService() {
    _instance ??= UserService._();
    return _instance!;
  }

  LoginModel? loginModel;
}
