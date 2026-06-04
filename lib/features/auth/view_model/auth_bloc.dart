import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_task/core/config/di/injection.dart';
import 'package:mediezy_task/core/services/storage_services.dart';
import 'package:mediezy_task/features/auth/model/login_request_model.dart';
import 'package:mediezy_task/features/auth/model/login_res_model.dart';
import 'package:mediezy_task/features/auth/repository/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repo;

  AuthBloc(this.repo) : super(AuthInitial()) {
    on<LoginPressed>(_login);
    on<SignupSubmitted>(_signup);
  }

Future<void> _login(LoginPressed event, Emitter emit) async {
  emit(AuthLoading());

  try {
    final response = await repo.login(
      LoginRequest(
        mobile: event.mobile,
        password: event.password,
      ),
    );

    final loginRes = LoginResponse.fromJson(response);

    await sl<StorageService>().saveLoginData(loginRes);

    emit(AuthSuccess(message: loginRes.message));
  } catch (e) {
    emit(AuthError(e.toString()));
  }
}
  Future<void> _signup(SignupSubmitted event, Emitter emit) async {
    emit(AuthLoading());

    try {
      await repo.register(event.request);

      emit(AuthSuccess(message: "Signup Successful"));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

}