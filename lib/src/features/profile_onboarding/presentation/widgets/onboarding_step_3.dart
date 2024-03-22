import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/size_consts.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../pages/onboarding_stepper.dart';

class OnboardingStep3 extends StatelessWidget {
  const OnboardingStep3({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.dimen_16),
          child: Text('Tell Us Your Date of Birth',
              style: theme.textTheme.headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
        const BuildBloodTypeWidget(),
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
        const BuildAllegiesChoices(),
      ],
    );
  }
}

class BuildBloodTypeWidget extends StatefulWidget {
  const BuildBloodTypeWidget({super.key});

  @override
  State<BuildBloodTypeWidget> createState() => _BuildBloodTypeWidgetState();
}

class _BuildBloodTypeWidgetState extends State<BuildBloodTypeWidget> {
  String? bloodTypeOption;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(bloodTypes.length, (rowIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            bloodTypes[rowIndex].length,
            (elIndex) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(Sizes.dimen_4),
                child: GestureDetector(
                  // splashColor: Colors.green, // splash color
                  onTap: () => _onBloodTypeSelected(
                      bloodTypes[rowIndex][elIndex]['name']),
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: bloodTypeOption ==
                            '${bloodTypes[rowIndex][elIndex]['name']}'
                        ? Column(
                            children: [
                              Stack(
                                children: [
                                  ImageFiltered(
                                    imageFilter: ImageFilter.dilate(
                                      radiusX: 1.5,
                                      radiusY: 1.5,
                                    ),
                                    child: SvgPicture.asset(
                                      bloodTypes[rowIndex][elIndex]['icon'],
                                      colorFilter: const ColorFilter.mode(
                                        Color(0xFF0196EA),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    bloodTypes[rowIndex][elIndex]['icon'],
                                  ),
                                ],
                              ),
                            ],
                          )
                        : SvgPicture.asset(
                            bloodTypes[rowIndex][elIndex]['icon'],
                          ),
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
}

class BuildAllegiesChoices extends StatefulWidget {
  const BuildAllegiesChoices({super.key});

  @override
  State<BuildAllegiesChoices> createState() => _BuildAllegiesChoicesState();
}

class _BuildAllegiesChoicesState extends State<BuildAllegiesChoices> {
  String? allegiesOption;
  @override
  Widget build(BuildContext context) {
    const String YES = 'Yes';
    const String NO = 'No';
    const String doNotKnow = 'Do not know';
    final allegiesOptions = <String>[YES, NO, doNotKnow];
    ThemeData theme = Theme.of(context);
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
