import 'package:mediezy_task/features/auth/model/sign_up_request_model.dart';

abstract class AuthEvent{}

class LoginPressed
extends AuthEvent{

 final String mobile;
 final String password;

 LoginPressed(
 this.mobile,
 this.password);

}

class SignupSubmitted extends AuthEvent {
  final SignUpRequest request;

  SignupSubmitted(this.request);
}