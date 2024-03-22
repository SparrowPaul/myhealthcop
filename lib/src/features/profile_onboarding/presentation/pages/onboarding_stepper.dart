// ignore_for_file: constant_pattern_never_matches_value_type, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
//import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:myhealthcop/src/core/constants/asset_consts.dart';
import 'package:myhealthcop/src/core/constants/size_consts.dart';
import 'package:myhealthcop/src/core/utils/validator.dart';
import 'package:myhealthcop/src/core/widgets/custom_animated_weight.dart';
import 'package:myhealthcop/src/core/widgets/custom_phone_number_field.dart';
import 'package:myhealthcop/src/core/widgets/custom_stepper.dart';
import 'package:myhealthcop/src/core/widgets/custom_text_form_field.dart';
import 'package:myhealthcop/src/features/profile_onboarding/presentation/widgets/gender_widget.dart';
import 'package:wheel_picker/wheel_picker.dart';

enum Sex { male, female }

enum BloodTypes {
  A_POSITIVE,
  A_NEGATIVE,
  B_POSITIVE,
  B_NEGATIVE,
  AB_POSITIVE,
  AB_NEGATIVE,
  O_POSITIVE,
  O_NEGATIVE
}

const String YES = 'Yes';
const String NO = 'No';
const String DO_NOT_KNOW = 'Do not know';

final bloodTypes = [
  [
    <String, dynamic>{
      'name': BloodTypes.A_POSITIVE,
      'icon': AssetConsts.aPositiveIcon
    },
    <String, dynamic>{
      'name': BloodTypes.A_NEGATIVE,
      'icon': AssetConsts.aNegativeIcon
    },
    <String, dynamic>{
      'name': BloodTypes.B_POSITIVE,
      'icon': AssetConsts.bPositiveIcon
    },
    <String, dynamic>{
      'name': BloodTypes.B_NEGATIVE,
      'icon': AssetConsts.bNegativeIcon
    },
  ],
  [
    <String, dynamic>{
      'name': BloodTypes.AB_POSITIVE,
      'icon': AssetConsts.abPositiveIcon
    },
    <String, dynamic>{
      'name': BloodTypes.AB_NEGATIVE,
      'icon': AssetConsts.abNegativeIcon
    },
    <String, dynamic>{
      'name': BloodTypes.O_POSITIVE,
      'icon': AssetConsts.oPositiveIcon
    },
    <String, dynamic>{
      'name': BloodTypes.O_NEGATIVE,
      'icon': AssetConsts.oNegativeIcon
    },
  ]
];

class OnboardingStepper extends StatefulWidget {
  const OnboardingStepper({super.key});

  @override
  State<OnboardingStepper> createState() => _OnboardingStepperState();
}

class _OnboardingStepperState extends State<OnboardingStepper> {
  int _index = 0;
  String? allegiesOption;
  String? bloodTypeOption;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    print('STEPS $_index');

    final secondsWheel = WheelPickerController(itemCount: 60, initialIndex: 60);
    const textStyle = TextStyle(fontSize: 32.0, height: 1.5);

    // Timer.periodic(const Duration(seconds: 1), (_) => secondsWheel.shiftDown());

    return Scaffold(
      body: Center(
        child: CustomStepper(
          type: CustomStepperType.horizontal,
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
            // if (_index <= 0) {
            setState(() {
              _index += 1;
            });
            // }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          steps: <CustomStep>[
            CustomStep(
              title: const Text('Step 1'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Tell Us Your Contact Details',
                    style: theme.textTheme.headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Text('We want to know. What should we call you?'),
                  const SizedBox(height: Sizes.dimen_16),
                  Form(
                    // key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CustomTextFormField(
                          height: 48,
                          label: 'First Name',
                          validator: (value) =>
                              CustomValidator.validateTextField(value),
                        ),
                        const SizedBox(height: Sizes.dimen_16),
                        CustomTextFormField(
                          label: 'Last Name',
                          validator: (value) =>
                              CustomValidator.validateTextField(value),
                        ),
                        const SizedBox(height: Sizes.dimen_16),
                        CustomPhoneNumberField(
                          label: const Text('Phone Number'),
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          validator: (value) =>
                              CustomValidator.validateTextField(value),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            CustomStep(
              title: const Text('Step 2'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Tell Us Your Date of Birth',
                      style: theme.textTheme.headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: Sizes.dimen_16),
                  CustomTextFormField(
                      label: 'Date of Birth',
                      hintText: 'MM/DD/YYYY',
                      validator: (value) =>
                          CustomValidator.validateTextField(value)),
                  const SizedBox(height: Sizes.dimen_16 * 2),
                  Text('What is Your Sex?',
                      style: theme.textTheme.headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: Sizes.dimen_16),
                  const GenderWidget(),
                ],
              ),
            ),
            CustomStep(
              title: const Text('Step 3'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: Sizes.dimen_16),
                    child: Text('Tell Us Your Date of Birth',
                        style: theme.textTheme.headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                  _buildBloodTypeWidget(),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const Text('I do not know my blood type')
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: Sizes.dimen_16 * 2, bottom: Sizes.dimen_8),
                    child: Text('Do You Have Allergies?',
                        style: theme.textTheme.headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                  _buildAllegiesChoices(theme),
                ],
              ),
            ),
            CustomStep(
              title: const Text('Step 4'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: Sizes.dimen_16),
                    child: Text('What is Your Weight?',
                        style: theme.textTheme.headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold)),
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
                  CustomAnimatedWeight(
                    min: 148,
                    max: 204,
                    onChange: (value) {
                      setState(() {
                        // selectedValue = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            CustomStep(
              title: const Text('Step 4'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: Sizes.dimen_16),
                    child: Text('What are Your \nWellness Goals?',
                        style: theme.textTheme.headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBloodTypeWidget() {
    return Column(
      children: List.generate(bloodTypes.length, (rowIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            bloodTypes[rowIndex].length,
            (elIndex) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(Sizes.dimen_4),
                child: IconButton(
                  // splashColor: Colors.green, // splash color
                  onPressed: () => _onBloodTypeSelected(
                      bloodTypes[rowIndex][elIndex]['name']),
                  icon: bloodTypeOption ==
                          '${bloodTypes[rowIndex][elIndex]['name']}'
                      ? SvgPicture.asset(
                          bloodTypes[rowIndex][elIndex]['icon'],
                          colorFilter: const ColorFilter.mode(
                              Colors.red, BlendMode.saturation),
                        )
                      : SvgPicture.asset(
                          bloodTypes[rowIndex][elIndex]['icon'],
                        ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  _onBloodTypeSelected(BloodTypes value) {
    switch (value) {
      case BloodTypes.A_POSITIVE:
        setState(() {
          bloodTypeOption = '${BloodTypes.A_POSITIVE}';
        });
        break;
      case BloodTypes.A_NEGATIVE:
        setState(() {
          bloodTypeOption = '${BloodTypes.A_NEGATIVE}';
        });
        break;
      case BloodTypes.B_POSITIVE:
        setState(() {
          bloodTypeOption = '${BloodTypes.B_POSITIVE}';
        });
        break;
      case BloodTypes.B_NEGATIVE:
        setState(() {
          bloodTypeOption = '${BloodTypes.B_NEGATIVE}';
        });
        break;
      case BloodTypes.AB_POSITIVE:
        setState(() {
          bloodTypeOption = '${BloodTypes.AB_POSITIVE}';
        });
        break;
      case BloodTypes.AB_NEGATIVE:
        setState(() {
          bloodTypeOption = '${BloodTypes.AB_NEGATIVE}';
        });
        break;
      default:
        return;
    }
  }

  Widget _buildAllegiesChoices(ThemeData theme) {
    final allegiesOptions = <String>[YES, NO, DO_NOT_KNOW];

    return Column(
      children: [
        Row(
          children: List.generate(
            allegiesOptions.length,
            (index) => Padding(
              padding: const EdgeInsets.all(Sizes.dimen_2),
              child: TextButton(
                onPressed: () =>
                    _onAllegiesChoicePressed(allegiesOptions[index]),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                    backgroundColor: Colors.grey[100]),
                child: Text(
                  allegiesOptions[index],
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ),
          ),
        ),
        allegiesOption == YES
            ? CustomTextFormField(
                label: 'Allergy',
                validator: (value) => CustomValidator.validateTextField(value),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  _onAllegiesChoicePressed(String value) {
    switch (value) {
      case YES:
        setState(() {
          allegiesOption = YES;
        });
        break;
      case NO:
        setState(() {
          allegiesOption = NO;
        });
        break;
      case DO_NOT_KNOW:
        setState(() {
          allegiesOption = DO_NOT_KNOW;
        });
        break;
      default:
        return;
    }
  }
}
