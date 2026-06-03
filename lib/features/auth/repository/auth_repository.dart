import 'package:mediezy_task/features/auth/model/login_request_model.dart';
import 'package:mediezy_task/features/auth/model/login_res_model.dart';

abstract class AuthRepository{

 Future<LoginResponse> login(
   LoginRequest request,
 );

}