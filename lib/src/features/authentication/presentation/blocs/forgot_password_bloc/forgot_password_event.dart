part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class OnEmailSubmitted extends ForgotPasswordEvent {
  final String email;
  
  const OnEmailSubmitted({required this.email});

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [email];
}