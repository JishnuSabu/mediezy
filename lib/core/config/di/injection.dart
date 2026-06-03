import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mediezy_task/core/services/storage_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mediezy_task/core/network/api_client.dart';
import 'package:mediezy_task/features/auth/data_sources/auth_remote_data_source.dart';
import 'package:mediezy_task/features/auth/repository/auth_repository.dart';
import 'package:mediezy_task/features/auth/repository/auth_repository_impl.dart';
import 'package:mediezy_task/features/auth/view_model/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  await SharedPreferences.getInstance();

  sl.registerLazySingleton(
      ()=>http.Client());

  sl.registerLazySingleton<StorageService>(
      ()=>StorageService());

  sl.registerLazySingleton(
      ()=>ApiClient(sl()));

  sl.registerLazySingleton(
      ()=>AuthRemoteDatasource(sl()));

  sl.registerLazySingleton<AuthRepository>(
      ()=>AuthRepositoryImpl(sl()));

  sl.registerFactory(
      ()=>AuthBloc(sl()));

}