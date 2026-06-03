import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_task/core/config/di/injection.dart';
import 'package:mediezy_task/core/services/storage_services.dart';
import 'package:mediezy_task/features/auth/model/login_request_model.dart';
import 'package:mediezy_task/features/auth/repository/auth_repository.dart';
import 'package:mediezy_task/features/auth/view_model/auth_event.dart';
import 'package:mediezy_task/features/auth/view_model/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repo;

  AuthBloc(this.repo) : super(AuthInitial()) {
    on<LoginPressed>(_login);
  }

  String? validateMobile(String mobile) {
    if (mobile.isEmpty) {
      return "Mobile number is required";
    }
    if (mobile.length < 10) {
      return "Enter valid mobile number";
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Password is required";
    }
    if (password.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  Future<void> _login(LoginPressed event, Emitter emit) async {
    emit(AuthLoading());

    try {
      await repo.login(
        LoginRequest(mobile: event.mobile, password: event.password),
      );
      await sl<StorageService>().saveLogin();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
