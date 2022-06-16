import 'package:dio/dio.dart';
import 'package:hero_software_test/repositories/forgot_password_repository.dart';

class ForgotPasswordController {
  static final Dio dio = Dio();
  final ForgotPasswordRepository _repository = ForgotPasswordRepository(dio);

  Future<void> forgotPassword({required String email}) async {
    await _repository.forgotPassword(email);
  }
}
