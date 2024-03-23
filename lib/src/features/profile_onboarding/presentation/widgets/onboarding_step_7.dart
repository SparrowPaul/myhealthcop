import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myhealthcop/src/core/constants/asset_consts.dart';
import 'activity_level_widget.dart';
import '../../../../core/constants/size_consts.dart';

class OnboardingStep7 extends StatelessWidget {
  const OnboardingStep7({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'How active are you?',
          style: theme.textTheme.headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: Sizes.dimen_16),
        const ActivityLevelWidget(),
        SizedBox(
          height: Sizes.dimen_50,
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff00ace9).withOpacity(0.05),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Info
                Row(
                  children: [
                    SvgPicture.asset(
                      AssetConsts.draftLineIcon,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: Sizes.dimen_8),
                      child: Text("Your activity level is Sedentary!",
                          style: const TextStyle(
                              color: const Color(0xff34405e),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                Text(
                    "Typical daily living activities (eg household tasks walking to bus etc)",
                    style: const TextStyle(
                        color: const Color(0xff34405e),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: Sizes.dimen_12),
                    textAlign: TextAlign.left),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
