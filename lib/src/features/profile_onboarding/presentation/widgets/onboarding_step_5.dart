import 'package:flutter/material.dart';
import 'package:myhealthcop/src/features/profile_onboarding/presentation/widgets/wellness_goals_1.dart';
import 'package:myhealthcop/src/features/profile_onboarding/presentation/widgets/wellness_goals_2.dart';
import '../../../../core/constants/size_consts.dart';

class OnboardingStep5 extends StatefulWidget {
  const OnboardingStep5({super.key});

  @override
  State<OnboardingStep5> createState() => _OnboardingStep5State();
}

class _OnboardingStep5State extends State<OnboardingStep5> {
  final pages = <Widget>[
    const WellnessGoalsPage1(),
    const WellnessGoalsPage2(),
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
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.dimen_16),
          child: Text('What are Your \nWellness Goals?',
              style: theme.textTheme.headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return Transform(
                transform: Matrix4.identity()..rotateX(currentPage - index),
                child: pages[index],
              );
            },
            onPageChanged: (int pageIndex) {
              //context.read<OnboardingCubit>().onPageChanged(pageIndex);
            },
          ),
        ),
      ],
    );
  }
}
