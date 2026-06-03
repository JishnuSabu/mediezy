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

  // ---------------- LOGIN ----------------
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
  // ---------------- SIGNUP ----------------
  Future<void> _signup(SignupSubmitted event, Emitter emit) async {
    emit(AuthLoading());

    try {
      await repo.register(event.request);

      emit(AuthSuccess(message: "Signup Successful"));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // ---------------- VALIDATIONS (optional) ----------------
  String? validateMobile(String mobile) {
    if (mobile.isEmpty) return "Mobile number is required";
    if (mobile.length < 10) return "Enter valid mobile number";
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) return "Password is required";
    if (password.length < 6) return "Password must be at least 6 characters";
    return null;
  }
  String? validateName(String value) {
  if (value.isEmpty) return "Name is required";
  if (value.length < 3) return "Minimum 3 characters required";
  return null;
}

String? validateEmail(String value) {
  if (value.isEmpty) return "Email is required";

  final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$");
  if (!emailRegex.hasMatch(value)) return "Enter valid email";

  return null;
}

String? validateAddress(String value) {
  if (value.isEmpty) return "Address is required";
  return null;
}

String? validateDate(String value, String label) {
  if (value.isEmpty) return "$label is required";
  return null;
}
}