import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myhealthcop/src/features/authentication/domain/entities/user.dart';

part 'profile_onboarding_event.dart';
part 'profile_onboarding_state.dart';

class ProfileOnboardingBloc extends Bloc<ProfileOnboardingEvent, ProfileOnboardingState> {
  ProfileOnboardingBloc() : super(ProfileOnboardingInitial()) {
    on<ProfileOnboardingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
