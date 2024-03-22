part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();  

  @override
  List<Object> get props => [];
}
class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {
  const AuthLoading();
  
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class Authed extends AuthState {
  final User user;

  const Authed(this.user);

  @override
  bool? get stringify => true;
}

class AuthFaiure extends AuthState {
  final String errorMessage;

  const AuthFaiure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  bool? get stringify => true;
}