import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});
  @override
  List<Object?> get props => [message];

  @override
  bool get stringify => true;
}


class LoginFailure extends Failure {
  final String errorMessage;

  const LoginFailure({required this.errorMessage})
      : super(message: errorMessage);
  @override
  List<Object> get props => [];
}

class LogoutFailure extends Failure {
  final String errorMessage;

  const LogoutFailure({required this.errorMessage})
      : super(message: errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class NoInternetFailure extends Failure {
  final String errorMessage;

  const NoInternetFailure({required this.errorMessage})
      : super(message: errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class ServerFailure extends Failure {
  final String errorMessage;

  const ServerFailure({required this.errorMessage})
      : super(message: errorMessage);
  @override
  List<Object> get props => [errorMessage];
}



class RegistrationFailure extends Failure {
  final String errorMessage;

  const RegistrationFailure({required this.errorMessage})
      : super(message: errorMessage);

  @override
  List<Object> get props => [];
}

class TimeoutFailure extends Failure {
  final String errorMessage;

  const TimeoutFailure({required this.errorMessage})
      : super(message: errorMessage);

  @override
  List<Object> get props => [];
}


class UnknownFailure extends Failure {
  final String errorMessage;

  const UnknownFailure({required this.errorMessage})
      : super(message: errorMessage);
  @override
  List<Object?> get props => [message];
}

