import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:myhealthcop/src/features/authentication/data/datasources/authentication_remote_datsource.dart';
import 'package:myhealthcop/src/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:myhealthcop/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:myhealthcop/src/features/authentication/domain/usecases/forgot_user_password.dart';
import 'package:myhealthcop/src/features/authentication/domain/usecases/login_user.dart';
import 'package:myhealthcop/src/features/authentication/domain/usecases/register_user.dart';
import 'package:myhealthcop/src/features/authentication/domain/usecases/reset_user_password.dart';
import 'package:myhealthcop/src/features/authentication/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:myhealthcop/src/features/authentication/presentation/blocs/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:myhealthcop/src/features/authentication/presentation/blocs/registration_bloc/registration_bloc.dart';

import '../network/network_info.dart';
import '../secure_storage/secure_storage.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  //Bloc

  locator.registerFactory<AuthBloc>(() => AuthBloc(locator()));
  locator.registerFactory<RegistrationBloc>(() => RegistrationBloc(locator()));
  locator.registerFactory<ForgotPasswordBloc>(() => ForgotPasswordBloc(locator()));

  // Repositories

  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(locator(), locator()),
  );

  // Usecase
  locator.registerLazySingleton(() => LoginUser(locator()));
  locator.registerLazySingleton(() => RegisterUser(locator()));
  locator.registerLazySingleton(() => ForgotUserPassword(locator()));
  locator.registerLazySingleton(() => ResetUserPassword(locator()));

  
  // DataSources

  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(locator()));

  // Core
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));
  locator.registerLazySingleton<ConnectionChecker>(() => ConnectionChecker());

  locator.registerLazySingleton(() => GraphQLCache());
  locator.registerLazySingleton<Link>(() =>  HttpLink('https://playground.mhcapp.co/2024-assessment/'));
  locator.registerLazySingleton(() =>  GraphQLClient(link: locator(), cache: locator()));
  
  locator
      .registerLazySingleton<SecureStorage>(() => SecureStorageImpl(locator()));
}
