import 'package:flutter/material.dart';
import '../../../../core/constants/size_consts.dart';

class OnboardingStep5 extends StatelessWidget {
  const OnboardingStep5({super.key});

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
      ],
    );
  }
}
