import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../core/widgets/custom_raised_button.dart';
import '../bloc/onboarding_cubit/onboarding_cubit.dart';

import '../widgets/widgets.dart';

class OnboardingProfileScreen extends StatefulWidget {
  const OnboardingProfileScreen({super.key});

  @override
  State<OnboardingProfileScreen> createState() =>
      _OnboardingProfileScreenState();
}

class _OnboardingProfileScreenState extends State<OnboardingProfileScreen> {
  final pages = <Widget>[
    const OnboardingStep1(),
    const OnboardingStep2(),
    const OnboardingStep3(),
    const OnboardingStep4(),
    const OnboardingStep5(),
    Container(
      child: const Center(
        child: Text('Page 6'),
      ),
    ),
    Container(
      child: const Center(
        child: Text('Page 7'),
      ),
    ),
    Container(
      child: const Center(
        child: Text('Page 8'),
      ),
    ),
  ];

  final pageController = PageController();
  double currentPage = 0.0;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: LayoutBuilder(builder: (context, constraints) {
              return Stack(
                children: [
                  BlocBuilder<OnboardingCubit, OnboardingState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => context
                                    .read<OnboardingCubit>()
                                    .previousPage(),
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Color(0xFF6E7179),
                                ),
                              ),
                              Text(
                                '${state.currentPage + 1}/8',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF6E7179),
                                ),
                              ),
                              const Text(
                                'SKIP',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF6E7179),
                                ),
                              ),
                            ],
                          ),
                          const Gap(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              pages.length,
                              (index) => OnboardingIndicator(
                                color: state.currentPage >= index
                                    ? const Color(0xFF03A1FA)
                                    : const Color(0xFFE6E8F5),
                              ),
                            ),
                          ),
                          const Gap(30),
                          Expanded(
                            child:
                                BlocListener<OnboardingCubit, OnboardingState>(
                              listener: (context, state) {
                                pageController.animateToPage(
                                  state.currentPage,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: PageView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: pageController,
                                itemCount: pages.length,
                                itemBuilder: (context, index) {
                                  return Transform(
                                    transform: Matrix4.identity()
                                      ..rotateX(currentPage - index),
                                    child: pages[index],
                                  );
                                },
                                onPageChanged: (int pageIndex) {
                                  context
                                      .read<OnboardingCubit>()
                                      .onPageChanged(pageIndex);
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 10,
                    child: CustomRaisedButton(
                      onPressed: () =>
                          context.read<OnboardingCubit>().nextPage(),
                      text: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 40,
      decoration: BoxDecoration(
        color: color ?? const Color(0xFFE6E8F5),
      ),
    );
  }
}
