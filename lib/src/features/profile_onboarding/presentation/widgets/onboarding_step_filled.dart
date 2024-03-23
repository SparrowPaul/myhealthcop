import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myhealthcop/src/core/constants/asset_consts.dart';
import 'package:myhealthcop/src/core/constants/color_consts.dart';
import '../../../../core/constants/size_consts.dart';

class OnboardingStepFilled extends StatelessWidget {
  const OnboardingStepFilled({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: Sizes.dimen_8),
        Text(
          'Your Summary',
          style: theme.textTheme.headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Container(
          width: double.infinity,
          height: Sizes.dimen_48,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: ColorConsts.whiteLilac,
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, 7),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.dimen_18,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetConsts.bmiIcon,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: Sizes.dimen_18),
                  child: Text("What is BMI",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: Sizes.dimen_14),
                      textAlign: TextAlign.left),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: Sizes.dimen_8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Sizes.dimen_140,
              height: Sizes.dimen_180,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: ColorConsts.cornFlowerBlue.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your BMI",
                        style: TextStyle(
                            color: const Color(0xa6022364),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.left),

                    SvgPicture.asset(
                      AssetConsts.bmiFrownIcon,
                    ),

                    // Value
                    Text("30",
                        style: const TextStyle(
                            color: const Color(0xff0e1339),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 32.0),
                        textAlign: TextAlign.left),

                    const Text("Obesity",
                        style: TextStyle(
                            color: Color(0xff0085c8),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: Sizes.dimen_12),
                        textAlign: TextAlign.left)
                  ],
                ),
              ),
            ),
            Container(
              width: Sizes.dimen_180,
              height: Sizes.dimen_180,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                color: Color(0xff00ace9),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Ideal BMI",
                        style: TextStyle(
                            color: ColorConsts.white,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: Sizes.dimen_14),
                        textAlign: TextAlign.center),
                    SvgPicture.asset(
                      AssetConsts.bmiStarIcon,
                    ),
                    const Text("18,5-24,9",
                        style: TextStyle(
                            color: ColorConsts.white,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: Sizes.dimen_32),
                        textAlign: TextAlign.left),
                    const Text("Normal weight",
                        style: TextStyle(
                            color: const Color(0xffcdf1ff),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: Sizes.dimen_12),
                        textAlign: TextAlign.left)
                  ],
                ),
              ),
            ),
          ],
        ),
        // Base
        const SizedBox(height: Sizes.dimen_8),
        Container(
          width: double.infinity,
          height: Sizes.dimen_190,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x1a0064a7),
                  offset: Offset(0, 2),
                  blurRadius: 10,
                  spreadRadius: 0)
            ],
            color: ColorConsts.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Recommended Daily Calories",
                    style: TextStyle(
                        color: Color(0xff0e1339),
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text("1550",
                            style: TextStyle(
                                color: const Color(0xff0e1339),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: Sizes.dimen_32),
                            textAlign: TextAlign.left),
                        Text("kcal",
                            style: const TextStyle(
                                color: const Color(0xff6e768d),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: Sizes.dimen_12),
                            textAlign: TextAlign.left),
                      ],
                    ),

                    // Value

                    SvgPicture.asset(
                      AssetConsts.bmiThunderIcon,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff00ace9).withOpacity(0.05),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  child: Text(
                      "An ideal daily intake of calories varies depending on age, metabolism and levels of physical activity, among other things",
                      style: const TextStyle(
                          color: const Color(0xff34405e),
                          fontWeight: FontWeight.w400,
        
                          fontStyle: FontStyle.normal,
                          fontSize: Sizes.dimen_12),
                      textAlign: TextAlign.left),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
