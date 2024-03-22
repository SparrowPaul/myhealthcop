import 'package:flutter/material.dart';
import '../../../../core/constants/asset_consts.dart';
import '../../../../core/constants/color_consts.dart';
import '../../../../core/constants/size_consts.dart';
import '../../../../core/widgets/widgets.dart';

class PasswordChangedScreen extends StatefulWidget {
  const PasswordChangedScreen({super.key});

  @override
  State<PasswordChangedScreen> createState() => _PasswordChangedScreenState();
}

class _PasswordChangedScreenState extends State<PasswordChangedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Password Changed",
          style: TextStyle(
            fontSize: Sizes.dimen_20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Sizes.dimen_20),
                  Image(
                    image: AssetImage(AssetConsts.passwordChangedIllustration),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: Sizes.dimen_20,
                        left: Sizes.dimen_20,
                        right: Sizes.dimen_20),
                    child: Text(
                      "The password has been changed sucessfully, you now need to login with your new password",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: Sizes.dimen_16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: Sizes.dimen_50,
            child: CustomRaisedButton(
                text: const Text(
                  'GO TO LOGIN',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                color: ColorConsts.cornFlowerBlue,
                onPressed: () {}),
          )
        ],
      ),
    );
  }
}
