import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:myhealthcop/src/core/constants/asset_consts.dart';

import '../pages/onboarding_stepper.dart';

class ActivityLevelWidget extends StatefulWidget {
  const ActivityLevelWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ActivityLevelWidgetState();
}

class _ActivityLevelWidgetState extends State<ActivityLevelWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 80,
                  height: 145,
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
                      _getActivityLevelButtonIcons(
                          ActivityLevel.sedentary), // icon
                      _getActivityLevelButtonLabel(
                          ActivityLevel.sedentary), // text
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
                  width: 80,
                  height: 145,
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
                      _getActivityLevelButtonIcons(
                          ActivityLevel.lowActive), // icon
                      _getActivityLevelButtonLabel(
                          ActivityLevel.lowActive), // text
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: InkWell(
                // splashColor: Colors.green, // splash color
                onTap: () {},
                child: Container(
                  width: 80,
                  height: 145,
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
                      _getActivityLevelButtonIcons(
                          ActivityLevel.active), // icon
                      _getActivityLevelButtonLabel(
                          ActivityLevel.active), // text
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
                  width: 80,
                  height: 145,
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
                      _getActivityLevelButtonIcons(
                          ActivityLevel.veryActive), // icon
                      _getActivityLevelButtonLabel(
                          ActivityLevel.veryActive), // text
                    ],
                  ),
                ),
              ),
            ),
          ],
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
                // _getActivityLevelButtonIcons(activityLevel[index]), // icon
                // _getActivityLevelButtonLabel(activityLevel[index]), // text
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getActivityLevelButtonIcons(ActivityLevel activityLevel) {
    switch (activityLevel) {
      case ActivityLevel.sedentary:
        return Image.asset(AssetConsts.sedentaryIcon);
      case ActivityLevel.lowActive:
        return Image.asset(AssetConsts.lowActive);
      case ActivityLevel.active:
        return Image.asset(AssetConsts.activeIcon);
      case ActivityLevel.veryActive:
        return Image.asset(AssetConsts.veryActiveIcon);
      default:
        return;
    }
  }

  _getActivityLevelButtonLabel(ActivityLevel activityLevel) {
    switch (activityLevel) {
      case ActivityLevel.sedentary:
        return const Text('Sedentary');
      case ActivityLevel.lowActive:
        return const Text('Low Active');
      case ActivityLevel.active:
        return const Text('Active');
      case ActivityLevel.veryActive:
        return const Text('Very Active');
      default:
        return;
    }
  }
}
