part of 'profile_onboarding_bloc.dart';

abstract class ProfileOnboardingState extends Equatable {
  const ProfileOnboardingState();  

  @override
  List<Object> get props => [];
}
class ProfileOnboardingInitial extends ProfileOnboardingState {}

class ProfileOnboardingSuccess extends ProfileOnboardingState {
  final User user;

  const ProfileOnboardingSuccess(this.user);
  
  @override
  List<Object> get props => [user];
}

class ProfileOnboardingFailed extends ProfileOnboardingState {
  final String errorMessage;

  const ProfileOnboardingFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  bool? get stringify => true;
}
