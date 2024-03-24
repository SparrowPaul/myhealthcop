import 'package:dartz/dartz.dart';
import 'package:myhealthcop/src/core/errors/failures.dart';
import 'package:myhealthcop/src/features/authentication/domain/entities/user.dart';

abstract class ProfileOnboardingRepository {
  Future<Either<Failure, String>> updateUser(String firstName, String lastName, String userType);
  Future<Either<Failure, User>> createUserProfile(String email, String password, String userType);
}