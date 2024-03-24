import 'package:flutter/material.dart';
import 'package:myhealthcop/src/core/widgets/custom_animated_height.dart';
import '../../../../core/constants/size_consts.dart';
import '../../../../core/widgets/custom_animated_weight.dart';

class OnboardingStep4 extends StatefulWidget {
  const OnboardingStep4({super.key});

  @override
  State<OnboardingStep4> createState() => _OnboardingStep4State();
}

class _OnboardingStep4State extends State<OnboardingStep4> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.dimen_16),
          child: Text(
            'What is Your Weight?',
            style: theme.textTheme.headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        CustomAnimatedWeight(
          min: 44,
          max: 104,
          onChange: (value) {
            setState(() {
              // selectedValue = newValue;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: Sizes.dimen_16 * 3, bottom: Sizes.dimen_16),
          child: Text('How Tall are You?',
              style: theme.textTheme.headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
        CustomAnimatedHeight(
          min: 148,
          max: 204,
          onChange: (value) {
            setState(() {
              // selectedValue = newValue;
            });
          },
        ),
      ],
    );
  }
}
