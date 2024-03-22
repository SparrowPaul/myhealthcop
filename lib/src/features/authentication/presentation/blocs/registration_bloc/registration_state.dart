part of 'registration_bloc.dart';

sealed class RegistrationState extends Equatable {
  const RegistrationState();
  
  @override
  List<Object> get props => [];
}

final class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {
  const RegistrationLoading();
  
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class Registered extends RegistrationState {
  final User user;

  const Registered(this.user);

  @override
  bool? get stringify => true;
}

class RegistrationFaiure extends RegistrationState {
  final String errorMessage;

  const RegistrationFaiure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  bool? get stringify => true;
}