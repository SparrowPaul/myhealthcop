part of 'password_reset_bloc.dart';

sealed class PasswordResetState extends Equatable {
  const PasswordResetState();
  
  @override
  List<Object> get props => [];
}

final class PasswordResetInitial extends PasswordResetState {}

class ForgotPasswordLoading extends PasswordResetState {
  const ForgotPasswordLoading();
  
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class PasswordResetSuccess extends PasswordResetState {
  final String message;

  const PasswordResetSuccess(this.message);

  @override
  bool? get stringify => true;
}

class PasswordResetFaiure extends PasswordResetState {
  final String errorMessage;

  const PasswordResetFaiure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  bool? get stringify => true;
}