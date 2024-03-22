import 'package:flutter/material.dart';
import '../../../../core/constants/asset_consts.dart';
import '../../../../core/constants/color_consts.dart';
import '../../../../core/constants/size_consts.dart';
import '../../../../core/widgets/widgets.dart';

class ResetSuccessfulScreen extends StatefulWidget {
  const ResetSuccessfulScreen({super.key});

  @override
  State<ResetSuccessfulScreen> createState() => _ResetSuccessfulScreenState();
}

class _ResetSuccessfulScreenState extends State<ResetSuccessfulScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reset Successful",
          style: TextStyle(
            fontSize: Sizes.dimen_20,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context, true),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
                Icons.close), // Replace 'Icons.settings' with your desired icon
            onPressed: () {
              // Add your onPressed functionality here
            },
          ),
        ],
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
                    image: AssetImage(AssetConsts.resetSuccessfulIllustration),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: Sizes.dimen_20,
                        left: Sizes.dimen_20,
                        right: Sizes.dimen_20),
                    child: Text(
                      "We just sent an email with instruction to reset your password to",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: Sizes.dimen_16),
                    ),
                  ),
                  Text(
                    "user@myhealthcop.com",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: Sizes.dimen_140,
            child: Row(
              children: [
                Text("Didnt receive email?"),
                SizedBox(
                  width: Sizes.dimen_4,
                ),
                Text(
                  "RESEND",
                  style: TextStyle(
                      color: ColorConsts.cornFlowerBlue,
                      fontSize: Sizes.dimen_15,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: Sizes.dimen_50,
            child: CustomRaisedButton(
                text: const Text(
                  'OPEN EMAIL APP',
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
