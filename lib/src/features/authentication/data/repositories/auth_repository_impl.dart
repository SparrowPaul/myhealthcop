import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/authentication_remote_datsource.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl(
    this._remoteDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, User>> login(
      String email, String password, String userType) async {
    if (await _networkInfo.isConnected) {
      try {
        final user = await _remoteDataSource.login(email, password, userType);
        return Right(user);
      } on LoginException catch (e) {
        return Left(LoginFailure(errorMessage: e.errorMessage));
      }
    } else {
      return const Left(NoInternetFailure(errorMessage: 'No internet'));
    }
  }

  @override
  Future<Either<Failure, User>> register(String email, String password, String userType) async {
    if (await _networkInfo.isConnected) {
      try {
        final user = await _remoteDataSource.register(email, password, userType);
        return Right(user);
      } on RegistrationException catch (e) {
        return Left(RegistrationFailure(errorMessage: e.errorMessage));
      }
    } else {
      return const Left(NoInternetFailure(errorMessage: 'No internet'));
    }
  }
  
  @override
  Future<Either<Failure, String>> forgotPassword(String email) async {
    if (await _networkInfo.isConnected) {
      try {
        final message = await _remoteDataSource.forgotPassword(email);
        return Right(message);
      } on ForgotPasswordException catch (e) {
        return Left(RegistrationFailure(errorMessage: e.errorMessage));
      }
    } else {
      return const Left(NoInternetFailure(errorMessage: 'No internet'));
    }
  }
  
  @override
  Future<Either<Failure, String>> resetPassword(String token, String newPassword) async {
    if (await _networkInfo.isConnected) {
      try {
        final uid = '';
        final message = await _remoteDataSource.resetPassword(token, uid, newPassword);
        return Right(message);
      } on ResetPasswordException catch (e) {
        return Left(RegistrationFailure(errorMessage: e.errorMessage));
      }
    } else {
      return const Left(NoInternetFailure(errorMessage: 'No internet'));
    }
  }
}
