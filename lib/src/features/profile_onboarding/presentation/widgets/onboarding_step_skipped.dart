import 'package:flutter/material.dart';
import '../../../../core/constants/asset_consts.dart';
import '../../../../core/constants/size_consts.dart';

class OnboardingStepSkipped extends StatelessWidget {
  const OnboardingStepSkipped({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return const Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Sizes.dimen_20),
                Image(
                  image: AssetImage(AssetConsts.togetherIllustration),
                ),
                // Header
                Text("You Ready to Go",
                    style: TextStyle(
                        color: Color(0xff161b46),
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 24.0),
                    textAlign: TextAlign.center),
                // Description
                Text("Don't forget to fill in your profile later",
                    style: TextStyle(
                        color: Color(0xff34405e),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.center)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
