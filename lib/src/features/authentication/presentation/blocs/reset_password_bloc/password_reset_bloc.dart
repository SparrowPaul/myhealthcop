import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myhealthcop/src/features/authentication/domain/usecases/reset_user_password.dart';

part 'password_reset_event.dart';
part 'password_reset_state.dart';

class PasswordResetBloc extends Bloc<PasswordResetEvent, PasswordResetState> {
  final ResetUserPassword _resetUserPassword;
  PasswordResetBloc(this._resetUserPassword) : super(PasswordResetInitial()) {
    on<PasswordResetEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<OnPasswordResetCredSubmitted>(((event, emit) async {
      final failureOrMessage = await _resetUserPassword({'token': event.token, 'password': event.newPassword});
      final result = failureOrMessage.fold(
        (failure) => PasswordResetFaiure(failure.message),
        (message) => PasswordResetSuccess(message),
      );
      return emit(result);
    }));
  }
}
