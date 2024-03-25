import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:myhealthcop/src/features/authentication/presentation/blocs/auth_bloc/auth_bloc.dart';
import '../../../../core/constants/asset_consts.dart';
import '../../../../core/constants/color_consts.dart';
import '../../../../core/constants/route_consts.dart';
import '../../../../core/constants/size_consts.dart';
import '../../../../core/widgets/logo_widget.dart';
import '../../../../core/widgets/text_subtitle_widget.dart';

import '../../../../core/widgets/widgets.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late bool _passwordVisible;
  late GlobalKey<FormState> formKey;
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  bool? isUserAgreedToTermsChecked = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          showSnackBar(state.errorMessage, Colors.red);
        } else if (state is Authed) {
          Navigator.of(context).pushNamed(RouteConsts.welcomeRoute);
        }
      },
      child: Form(
        key: formKey,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.dimen_22, vertical: Sizes.dimen_80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Column(
                        children: [
                          LogoWidget(),
                          SizedBox(
                            height: 16,
                          ),
                          Image(
                            image: AssetImage(AssetConsts.loginText),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextSubtitleWidget(
                          title: "Email",
                        ),
                        const SizedBox(
                          height: Sizes.dimen_10,
                        ),
                        TextFormField(
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                            FormBuilderValidators.minLength(
                              8,
                              errorText: "Enter a valid email",
                            ),
                          ]),
                          controller: emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                              bottom: Sizes.dimen_5,
                              left: Sizes.dimen_15,
                            ),
                            filled: true,
                            fillColor: ColorConsts.whiteLilac,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_5),
                              borderSide: const BorderSide(
                                  width: 2, color: ColorConsts.whiteLilac),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_5),
                              borderSide: const BorderSide(
                                  width: 2, color: ColorConsts.whiteLilac),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_5),
                              borderSide: const BorderSide(
                                  width: 2, color: ColorConsts.whiteLilac),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextSubtitleWidget(
                          title: "Password",
                        ),
                        const SizedBox(
                          height: Sizes.dimen_10,
                        ),
                        TextFormField(
                          obscureText: _passwordVisible,
                          obscuringCharacter: "*",
                          controller: passwordTextController,
                          keyboardType: TextInputType.emailAddress,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(
                              8,
                              errorText: "Enter a valid password",
                            ),
                          ]),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                              bottom: Sizes.dimen_5,
                              left: Sizes.dimen_15,
                            ),
                            filled: true,
                            fillColor: ColorConsts.whiteLilac,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_5),
                              borderSide: const BorderSide(
                                  width: 2, color: ColorConsts.whiteLilac),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_5),
                              borderSide: const BorderSide(
                                  width: 2, color: ColorConsts.whiteLilac),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_5),
                              borderSide: const BorderSide(
                                  width: 2, color: ColorConsts.whiteLilac),
                            ),
                            suffixIcon: IconButton(
                              icon: Image(
                                image: _passwordVisible
                                    ? const AssetImage(AssetConsts.showPassword)
                                    : const AssetImage(
                                        AssetConsts.hidePassword),
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: Sizes.dimen_10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteConsts.resetPasswordRoute,
                            );
                          },
                          child: const Text(
                            "FORGOT PASSWORD?",
                            style: TextStyle(
                                color: ColorConsts.cornFlowerBlue,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.3),
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return CustomRaisedButton(
                            text: const CircularProgressIndicator(
                                color: Colors.white),
                            onPressed: () {},
                          );
                        } else {
                          return CustomRaisedButton(
                              text: const Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              width: double.infinity,
                              color: ColorConsts.cornFlowerBlue,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                        OnLoginCredSubmitted(
                                          email:
                                              emailTextController.text.trim(),
                                          password: passwordTextController.text
                                              .trim(),
                                          userType: 'CUSTOMER',
                                        ),
                                      );
                                }
                              });
                        }
                      },
                    ),
                    const Center(
                      child: Text("Or continue with"),
                    ),
                    const Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image(
                            image: AssetImage(AssetConsts.googleIcon),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Image(
                            image: AssetImage(AssetConsts.appleIcon),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Need an account? "),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteConsts.createAccountRoute,
                            );
                          },
                          child: const Text(
                            "CREATE ACCOUNT",
                            style: TextStyle(
                                color: ColorConsts.cornFlowerBlue,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.3),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showSnackBar(String message, Color? backgroundColor) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
