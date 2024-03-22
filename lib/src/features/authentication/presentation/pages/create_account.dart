import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myhealthcop/src/core/constants/color_consts.dart';
import 'package:myhealthcop/src/core/service_locator/service_locator.dart';
import 'package:myhealthcop/src/features/authentication/presentation/widgets/registration_form.dart';

import '../blocs/registration_bloc/registration_bloc.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationBloc>(
      create: (_) => locator<RegistrationBloc>(),
      child: const Scaffold(
        backgroundColor: ColorConsts.white,
        body: RegistrationForm(),
      ),
    );
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
