import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  void onPageChanged(int pageIndex) {
    emit(
      state.copyWith(
        currentPage: pageIndex,
      ),
    );
  }

  void previousPage() {
    if (state.currentPage != 0 && state.currentPage < 8) {
      final previousPage = state.currentPage - 1;
      emit(state.copyWith(currentPage: previousPage));
    }
  }

  void nextPage() {
    if (state.currentPage >= 0 && state.currentPage != 7) {
      final nextPage = state.currentPage + 1;
      emit(state.copyWith(currentPage: nextPage));
    }
  }
}
