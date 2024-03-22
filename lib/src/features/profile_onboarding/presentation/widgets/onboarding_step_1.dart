import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../../core/constants/size_consts.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/custom_phone_number_field.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class OnboardingStep1 extends StatelessWidget {
  const OnboardingStep1({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Tell Us Your Contact Details',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          'We want to know. What should we call you?',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: Sizes.dimen_24),
        Form(
          // key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomTextFormField(
                label: 'First Name',
                validator: (value) => CustomValidator.validateTextField(value),
              ),
              const SizedBox(height: Sizes.dimen_24),
              CustomTextFormField(
                label: 'Last Name',
                validator: (value) => CustomValidator.validateTextField(value),
              ),
              const SizedBox(height: Sizes.dimen_24),
              CustomPhoneNumberField(
                label: const Text('Phone Number'),
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                validator: (value) => CustomValidator.validateTextField(value),
              ),
            ],
          ),
        )
      ],
    );
  }
}
