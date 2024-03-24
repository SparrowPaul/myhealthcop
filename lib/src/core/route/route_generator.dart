import 'package:flutter/material.dart';
import 'package:myhealthcop/src/features/authentication/presentation/pages/change_password.dart';
import '../constants/route_consts.dart';
import '../../features/authentication/presentation/pages/create_account.dart';
import '../../features/authentication/presentation/pages/forgot_password.dart';
import '../../features/authentication/presentation/pages/login.dart';
import '../../features/profile_onboarding/presentation/pages/onboarding_stepper.dart';
import '../../features/profile_onboarding/presentation/pages/welcome_page.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteConsts.welcomeRoute:
      return _getPageRoute(const WelcomePage());
    case RouteConsts.onBoardingRoute:
      return _getPageRoute(const OnboardingStepper());
    case RouteConsts.loginRoute:
      return _getPageRoute(const Login());
    case RouteConsts.resetPasswordRoute:
      return _getPageRoute(const ResetPasswordScreen());
    case RouteConsts.createAccountRoute:
      return _getPageRoute(const CreateAccount());
    case RouteConsts.changepasswordRoute:
      return _getPageRoute(const ChangePasswordScreen());

    default:
      return null;
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
