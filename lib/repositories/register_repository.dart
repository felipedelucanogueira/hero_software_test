import 'package:dio/dio.dart';
import 'package:hero_software_test/models/register_model.dart';

class RegisterRepository {
  RegisterRepository(this.dio);
  final Dio dio;

  Future<void> register({
    required String email,
    required String password,
    required String name,
    required String phone,
    final String registry = '',
  }) async {
    try {
      await dio.post(
        'https://api.remote.net.br/user/app',
        data: Register(
          name: name,
          email: email,
          password: password,
          phone: phone,
          registry: registry,
        ).toJson(),
      );
    } on DioError catch (e) {
      return Future.error(
        e.response?.data['\$error']['msg'] +
                '(${e.response!.data['\$error']['info']})' ??
            e.message,
      );
    }
  }
}
