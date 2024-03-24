import 'package:flutter/material.dart';
import 'package:myhealthcop/src/core/constants/asset_consts.dart';
import 'package:myhealthcop/src/core/constants/size_consts.dart';

class WellnessGoalsPage2 extends StatefulWidget {
  const WellnessGoalsPage2({super.key});

  @override
  State<WellnessGoalsPage2> createState() => _WellnessGoalsPage2State();
}

class _WellnessGoalsPage2State extends State<WellnessGoalsPage2> {
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
                  image: AssetImage(AssetConsts.gainWeightIcon),
                ),
                Image(
                  image: AssetImage(AssetConsts.keepFitIcon),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(AssetConsts.reduceStressIcon),
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
