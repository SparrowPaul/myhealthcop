import 'package:flutter/material.dart';
import 'package:myhealthcop/src/core/constants/asset_consts.dart';
import 'package:myhealthcop/src/core/constants/size_consts.dart';

class WellnessGoalsPage1 extends StatefulWidget {
  const WellnessGoalsPage1({super.key});

  @override
  State<WellnessGoalsPage1> createState() => _WellnessGoalsPage1State();
}

class _WellnessGoalsPage1State extends State<WellnessGoalsPage1> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(top: Sizes.dimen_50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: AssetImage(AssetConsts.loseWeightIcon),
                ),
                Image(
                  image: AssetImage(AssetConsts.eatHealthyIcon),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage(AssetConsts.beMoreActiveIcon),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Image(
                      image: AssetImage(AssetConsts.defineYourGoalIcon),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
