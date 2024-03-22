part of 'password_reset_bloc.dart';

sealed class PasswordResetEvent extends Equatable {
  const PasswordResetEvent();

  @override
  List<Object> get props => [];
}


class OnPasswordResetCredSubmitted extends PasswordResetEvent {
  final String token;
  final String newPassword;
  
  const OnPasswordResetCredSubmitted({required this.token, required this.newPassword});

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [token, newPassword];
}