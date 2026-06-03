import 'package:mediezy_task/features/auth/data_sources/auth_remote_data_source.dart';
import 'package:mediezy_task/features/auth/model/login_request_model.dart';
import 'package:mediezy_task/features/auth/model/sign_up_request_model.dart';
import 'package:mediezy_task/features/auth/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource ds;

  AuthRepositoryImpl(this.ds);

  @override
  Future login(LoginRequest request) {
    return ds.login(request);
  }

  @override
  Future register(SignUpRequest request) {
    return ds.signUp(request);
  }
}