import 'package:mediezy_task/features/auth/model/login_request_model.dart';
import 'package:mediezy_task/features/auth/model/sign_up_request_model.dart';

abstract class AuthRepository {
  Future login(LoginRequest request);
  Future register(SignUpRequest request);
}