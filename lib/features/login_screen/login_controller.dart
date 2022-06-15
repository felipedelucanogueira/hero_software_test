import 'package:dio/dio.dart';
import 'package:hero_software_test/repositories/login_repository.dart';

class LoginController {
  static final Dio dio = Dio();

  final LoginRepository _repository = LoginRepository(dio);

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await _repository.login(email: email, password: password);
  }

  Future<void> logout() async {
    await _repository.logout();
  }

  Future<bool> isLoggedIn() async {
    return await _repository.isLoggedIn();
  }
}
