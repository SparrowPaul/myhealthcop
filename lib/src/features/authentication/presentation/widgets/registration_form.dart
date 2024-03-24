import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:myhealthcop/src/core/constants/asset_consts.dart';
import 'package:myhealthcop/src/core/constants/color_consts.dart';
import 'package:myhealthcop/src/core/constants/route_consts.dart';
import 'package:myhealthcop/src/core/constants/size_consts.dart';
import 'package:myhealthcop/src/core/widgets/logo_widget.dart';
import 'package:myhealthcop/src/core/widgets/text_subtitle_widget.dart';
import 'package:myhealthcop/src/core/widgets/widgets.dart';
import 'package:password_field_validator/password_field_validator.dart';

import '../blocs/registration_bloc/registration_bloc.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<StatefulWidget> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
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
    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationFailed) {
          showSnackBar(state.errorMessage, Colors.red);
        } else if (state is Registered) {
          Navigator.of(context).pushNamed(RouteConsts.onBoardingRoute);
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
                    horizontal: Sizes.dimen_22, vertical: 50),
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
                            image: AssetImage(AssetConsts.createAccountTitle),
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
                          title: "Create Password",
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
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Password should contain:"),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: PasswordFieldValidator(
                              minLength: 8,
                              uppercaseCharCount: 1,
                              lowercaseCharCount: 1,
                              numericCharCount: 1,
                              defaultColor: Colors.black,
                              successColor: ColorConsts.cornFlowerBlue,
                              failureColor: Colors.red,
                              controller: passwordTextController,
                              specialCharCount: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          // fillColor: MaterialStateProperty.resolveWith(getColor),
                          activeColor: ColorConsts.cornFlowerBlue,
                          value: isUserAgreedToTermsChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isUserAgreedToTermsChecked = value;
                            });
                          },
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const WayaInAppWebView(
                              //           url: AppConst.PRIVACY_POLICY_URL)),
                              // );
                            },
                            child: const Text(
                              "I have read and agreed to the My Health Cop's Privacy Policy & Terms of Use",
                              softWrap: true,
                              style: TextStyle(
                                fontSize: Sizes.dimen_14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<RegistrationBloc, RegistrationState>(
                      builder: (context, state) {
                        if (state is RegistrationLoading) {
                          return CustomRaisedButton(
                            text: const CircularProgressIndicator(
                                color: Colors.white),
                            onPressed: () {},
                          );
                        } else {
                          return CustomRaisedButton(
                              text: const Text(
                                'CREATE ACCOUNT',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              width: double.infinity,
                              color: isUserAgreedToTermsChecked == true
                                  ? ColorConsts.cornFlowerBlue
                                  : Colors.grey,
                              onPressed: () {
                                if (isUserAgreedToTermsChecked == true) {
                                  if (formKey.currentState!.validate()) {
                                    context.read<RegistrationBloc>().add(
                                          OnRegistrationCredSubmitted(
                                            email:
                                                emailTextController.text.trim(),
                                            password: passwordTextController
                                                .text
                                                .trim(),
                                            userType: 'CUSTOMER',
                                          ),
                                        );
                                  }
                                }
                              });
                        }
                      },
                    ),
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
