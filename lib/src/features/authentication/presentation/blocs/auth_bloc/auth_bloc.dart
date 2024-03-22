import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myhealthcop/src/features/authentication/domain/entities/user.dart';
import 'package:myhealthcop/src/features/authentication/domain/usecases/login_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser _loginUser;
  AuthBloc(this._loginUser) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      return emit(const AuthLoading());
    });
    on<OnLoginCredSubmitted>(((event, emit) async {
      final failureOrMessage = await _loginUser({'email': event.email, 'password': event.password, 'userType': event.userType});
      final result = failureOrMessage.fold(
        (failure) => AuthFaiure(failure.message),
        (user) => Authed(user),
      );
      return emit(result);
    }));
  }
}
