import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:myhealthcop/src/core/constants/route_consts.dart';
import 'package:myhealthcop/src/core/service_locator/service_locator.dart';
import 'package:myhealthcop/src/features/authentication/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:myhealthcop/src/features/authentication/presentation/blocs/forgot_password_bloc/forgot_password_bloc.dart';
import '../../../../core/constants/asset_consts.dart';
import '../../../../core/constants/color_consts.dart';
import '../../../../core/constants/size_consts.dart';
import '../../../../core/widgets/text_subtitle_widget.dart';

import '../../../../core/widgets/custom_raised_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late GlobalKey<FormState> formKey;
  final TextEditingController emailTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgotPasswordBloc>(
      create: (_) => locator<ForgotPasswordBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Reset Password",
            style: TextStyle(
              fontSize: Sizes.dimen_20,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons
                  .close), // Replace 'Icons.settings' with your desired icon
              onPressed: () {
                // Add your onPressed functionality here
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_22),
                child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
                  listener: (context, state) {
                    if (state is ForgotPasswordFaiure) {
                      showSnackBar(state.errorMessage, Colors.red);
                    } else if (state is ForgotPasswordSuccess) {
                      Navigator.of(context)
                          .pushNamed(RouteConsts.resetPasswordSuccessRoute);
                    }
                  },
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: Sizes.dimen_20),
                        const Image(
                          image:
                              AssetImage(AssetConsts.resetPasswordIllustration),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              top: Sizes.dimen_20,
                              left: Sizes.dimen_20,
                              right: Sizes.dimen_20),
                          child: Text(
                            "To rest you password, please enter the email address of your MyHealthCop account",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: Sizes.dimen_16),
                          ),
                        ),
                        const SizedBox(
                          height: Sizes.dimen_18,
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
                        const SizedBox(height: Sizes.dimen_10),
                        BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                          builder: (context, state) {
                            if (state is ForgotPasswordLoading) {
                              return CustomRaisedButton(
                                text: const CircularProgressIndicator(
                                    color: Colors.white),
                                onPressed: () {},
                              );
                            } else {
                              return CustomRaisedButton(
                                text: const Text(
                                  'CONFIRM',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                color: ColorConsts.cornFlowerBlue,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<ForgotPasswordBloc>().add(
                                          OnEmailSubmitted(
                                              email: emailTextController.text
                                                  .trim()),
                                        );
                                  }
                                },
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
