import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repositories/auth_repository.dart';

class ResetUserPassword implements BaseUseCase<String, Map<String, dynamic>> {
  final AuthRepository _authRepository;

  ResetUserPassword(this._authRepository);

  @override
  Future<Either<Failure, String>> call([Map<String, dynamic>? params]) async {
    return await _authRepository.resetPassword(
      params?['accessToken'],
      params?['newPassword'],
    );
  }
}
