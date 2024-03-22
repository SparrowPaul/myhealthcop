part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class OnLoginCredSubmitted extends AuthEvent {
  final String email;
  final String password;
  final String userType;

   const OnLoginCredSubmitted({required this.email, required this.password, required this.userType});

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [email, password, userType];
}