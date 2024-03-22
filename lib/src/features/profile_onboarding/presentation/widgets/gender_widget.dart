import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../pages/onboarding_stepper.dart';

class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key});

  @override
  State<StatefulWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: InkWell(
            // splashColor: Colors.green, // splash color
            onTap: () {},
            child: Container(
              width: 155.5,
              height: 170,
              decoration: BoxDecoration(
                color: const Color(0xFFF9FCFF),
                border: Border.all(
                  color: const Color(0xFFE6E8F3),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _getSexButtonIcons(Sex.female), // icon
                  _getSexButtonLabel(Sex.female), // text
                ],
              ),
            ),
          ),
        ),
        const Gap(15),
        Expanded(
          child: InkWell(
            // splashColor: Colors.green, // splash color
            onTap: () {},
            child: Container(
              width: 155.5,
              height: 170,
              decoration: BoxDecoration(
                color: const Color(0xFFF9FCFF),
                border: Border.all(
                  color: const Color(0xFFE6E8F3),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _getSexButtonIcons(Sex.male), // icon
                  _getSexButtonLabel(Sex.male), // text
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildSexButtons() {
    final sexes = [Sex.female, Sex.male];
    return List.generate(
      sexes.length,
      (index) => Expanded(
        child: Container(
          width: 155.5,
          height: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFE6E8F3),
            ),
          ),
          child: InkWell(
            // splashColor: Colors.green, // splash color
            onTap: () {}, // button pressed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _getSexButtonIcons(sexes[index]), // icon
                _getSexButtonLabel(sexes[index]), // text
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getSexButtonIcons(Sex sex) {
    switch (sex) {
      case Sex.female:
        return Image.asset('assets/images/female.png');
      case Sex.male:
        return Image.asset(
          'assets/images/male.png',
        );
      default:
        return;
    }
  }

  _getSexButtonLabel(Sex sex) {
    switch (sex) {
      case Sex.female:
        return const Text('Female');
      case Sex.male:
        return const Text('Male');
      default:
        return;
    }
  }
}
