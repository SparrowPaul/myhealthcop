import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myhealthcop/src/features/authentication/domain/usecases/forgot_user_password.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotUserPassword _forgotUserPassword;
  ForgotPasswordBloc(this._forgotUserPassword) : super(ForgotPasswordInitial()) {
    on<ForgotPasswordEvent>((event, emit) {
      return emit(const ForgotPasswordLoading());
    });
    on<OnEmailSubmitted>(((event, emit) async {
      final failureOrMessage = await _forgotUserPassword({'email': event.email});
      final result = failureOrMessage.fold(
        (failure) => ForgotPasswordFaiure(failure.message),
        (message) => ForgotPasswordSuccess(message),
      );
      return emit(result);
    }));
  }
}
