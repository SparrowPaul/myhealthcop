import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myhealthcop/src/features/authentication/domain/entities/user.dart';
import 'package:myhealthcop/src/features/authentication/domain/usecases/register_user.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegisterUser _registerUser;
  RegistrationBloc(this._registerUser) : super(RegistrationInitial()) {
    on<RegistrationEvent>((event, emit) {
      return emit(const RegistrationLoading());
    });
    on<OnRegistrationCredSubmitted>((event, emit) async {
      print('REG Bloc');
      final failureOrMessage = await _registerUser({'email': event.email, 'password': event.password, 'userType': event.userType});
      final result = failureOrMessage.fold(
        (failure) => RegistrationFailed(failure.message),
        (user) => Registered(user),
      );
      return emit(result);
    });
  }
}
