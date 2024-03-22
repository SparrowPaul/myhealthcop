import 'package:flutter/material.dart';

import '../constants/asset_consts.dart';
import '../constants/size_consts.dart';

// Widget to display the rounded edges myhealthcop logo
class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.dimen_55,
      width: Sizes.dimen_55,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.7),
        child: const Image(
          image: AssetImage(AssetConsts.imageName),
        ),
      ),
    );
  }
}