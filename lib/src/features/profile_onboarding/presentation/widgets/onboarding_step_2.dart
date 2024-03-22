import 'package:flutter/material.dart';
import '../../../../core/constants/size_consts.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'gender_widget.dart';

class OnboardingStep2 extends StatelessWidget {
  const OnboardingStep2({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Tell Us Your Date of Birth',
          style: theme.textTheme.headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: Sizes.dimen_16),
        CustomTextFormField(
          label: 'Date of Birth',
          hintText: 'MM/DD/YYYY',
          validator: (value) => CustomValidator.validateTextField(value),
        ),
        const SizedBox(height: Sizes.dimen_16 * 2),
        Text('What is Your Sex?',
            style: theme.textTheme.headlineSmall!
                .copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: Sizes.dimen_16),
        const GenderWidget(),
      ],
    );
  }
}
