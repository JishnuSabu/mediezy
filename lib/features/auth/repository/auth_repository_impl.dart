import 'package:mediezy_task/features/auth/data_sources/auth_remote_data_source.dart';
import 'package:mediezy_task/features/auth/model/login_request_model.dart';
import 'package:mediezy_task/features/auth/model/login_res_model.dart';
import 'package:mediezy_task/features/auth/repository/auth_repository.dart';

class AuthRepositoryImpl
implements AuthRepository{

 final AuthRemoteDatasource ds;

 AuthRepositoryImpl(this.ds);

 @override
 Future<LoginResponse> login(
 LoginRequest request){

   return ds.login(request);

 }

}