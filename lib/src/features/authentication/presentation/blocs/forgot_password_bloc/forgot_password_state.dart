part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
  
  @override
  List<Object> get props => [];
}

final class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {
  const ForgotPasswordLoading();
  
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final String message;

  const ForgotPasswordSuccess(this.message);

  @override
  bool? get stringify => true;
}

class ForgotPasswordFaiure extends ForgotPasswordState {
  final String errorMessage;

  const ForgotPasswordFaiure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  bool? get stringify => true;
}