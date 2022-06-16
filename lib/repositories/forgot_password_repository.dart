import 'package:dio/dio.dart';
import 'package:hero_software_test/models/forgot_password_model.dart';

class ForgotPasswordRepository {
  final Dio dio;
  ForgotPasswordRepository(this.dio);

  Future<void> forgotPassword(String email) async {
    try {
      await dio.post(
        'https://api.remote.net.br/user/reset',
        data: ForgotPassword(email: email).toJson(),
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
