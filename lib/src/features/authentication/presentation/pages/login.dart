import 'package:flutter/material.dart';
import 'package:myhealthcop/src/features/authentication/presentation/blocs/auth_bloc/auth_bloc.dart';
import '../../../../core/constants/color_consts.dart';
import '../../../../core/service_locator/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConsts.white,
        body: BlocProvider<AuthBloc>(
          create: (_) => locator<AuthBloc>(),
          child: const LoginForm(),
        ));
  }
}

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return ColorConsts.white;
  }
  return ColorConsts.cornFlowerBlue;
}
