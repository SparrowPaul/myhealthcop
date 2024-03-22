import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginUser implements BaseUseCase<User, Map<String, dynamic>> {
  final AuthRepository _authRepository;

  LoginUser(this._authRepository);

  @override
  Future<Either<Failure, User>> call([Map<String, dynamic>? params]) async {
    return await _authRepository.login(
      params?['email'],
      params?['password'],
      params?['userType'],
    );
  }
}