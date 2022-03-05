import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:serotonina/features/user_registration/data/datasources/user_datasource.dart';
import 'package:serotonina/features/user_registration/data/repositories/user_repositoty_impl.dart';
import 'package:serotonina/features/user_registration/domain/repositories/user_repository.dart';
import 'package:serotonina/features/user_registration/domain/usercases/submit_new_user.dart';
import 'package:serotonina/features/user_registration/presentation/bloc/user_registration_bloc.dart';

final sl = GetIt.instance;

void init() {
  // Features - User Registration
  //--Bloc
  sl.registerFactory(() => UserRegistrationBloc(sl()));
  //--Use cases
  sl.registerLazySingleton(() => SubmitNewUser(sl()));
  //--Repository
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl()));
  //--Data source
  sl.registerLazySingleton<UserDataSource>(
      () => UserDataSourceImpl(httpClient: sl()));

  // Core

  // External
  sl.registerLazySingleton(() => http.Client());
}
