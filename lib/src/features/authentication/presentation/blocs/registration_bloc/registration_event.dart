part of 'registration_bloc.dart';

sealed class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class OnRegistrationCredSubmitted extends RegistrationEvent {
  final String email;
  final String password;
  final String userType;

   const OnRegistrationCredSubmitted({required this.email, required this.password, required this.userType});

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [email, password, userType];
}