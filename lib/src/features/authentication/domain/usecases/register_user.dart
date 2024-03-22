import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class RegisterUser implements BaseUseCase<User, Map<String, dynamic>> {
  final AuthRepository _authRepository;

  RegisterUser(this._authRepository);

  @override
  Future<Either<Failure, User>> call([Map<String, dynamic>? params]) async {
    return await _authRepository.register(
      params?['email'],
      params?['password'],
      params?['userType'],
    );
  }
}