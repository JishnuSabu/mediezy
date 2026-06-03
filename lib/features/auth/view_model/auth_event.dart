abstract class AuthEvent{}

class LoginPressed
extends AuthEvent{

 final String mobile;
 final String password;

 LoginPressed(
 this.mobile,
 this.password);

}