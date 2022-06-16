import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hero_software_test/models/login_model.dart';

class LoginRepository {
  LoginRepository(this.dio);
  final Dio dio;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> login({required String email, required String password}) async {
    try {
      final response = await dio.post(
        'https://api.remote.net.br/user/app/login',
        data: Login(email: email, password: password).toJson(),
      );
      final token = response.data['token'];
      await _storage.write(key: 'token', value: token);
    } on DioError catch (e) {
      return Future.error(
        e.response?.data['\$error']['msg'] +
                '(${e.response!.data['\$error']['info']})' ??
            e.message,
      );
    }
  }

  Future<void> logout() async {
    await _storage.delete(key: 'token');
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'token');
    return token != null;
  }
}
