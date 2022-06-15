import 'package:dio/dio.dart';
import 'package:hero_software_test/repositories/register_repository.dart';

class RegisterController {
  static final Dio dio = Dio();
  final RegisterRepository _registerRepository = RegisterRepository(dio);

  Future<void> register({
    required String email,
    required String password,
    required String name,
    required String phone,
    final String registry = '',
  }) async {
    await _registerRepository.register(
      name: name,
      email: email,
      phone: phone,
      password: password,
      registry: registry,
    );
  }
}
