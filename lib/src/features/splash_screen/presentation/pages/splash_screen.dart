import 'dart:async';

import 'package:flutter/material.dart';
import '../../../../core/constants/asset_consts.dart';
import '../../../../core/constants/route_consts.dart';
import '../../../../core/constants/size_consts.dart';
import '../../../../core/widgets/logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(RouteConsts.loginRoute);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: Sizes.dimen_60),
        child: Stack(
          children: [
            // splash avatar container
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AssetConsts.splashAvatar),
                ),
              ),
            ),
            // splash frame container
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AssetConsts.splashFrame),
                ),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: Sizes.dimen_60, left: Sizes.dimen_30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // logo widget
                  LogoWidget(),
                  SizedBox(
                    height: Sizes.dimen_40,
                  ),
                  // spalsh title text
                  Image(
                    image: AssetImage(AssetConsts.splashTitle),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
