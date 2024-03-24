import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:myhealthcop/src/core/constants/asset_consts.dart';
import 'package:myhealthcop/src/core/constants/color_consts.dart';
import 'package:myhealthcop/src/core/constants/size_consts.dart';
import 'package:myhealthcop/src/core/widgets/text_subtitle_widget.dart';
import 'package:myhealthcop/src/core/widgets/widgets.dart';
import 'package:password_field_validator/password_field_validator.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<StatefulWidget> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
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
    return Form(
      key: formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.dimen_22, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(AssetConsts.changePasswordIcon),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextSubtitleWidget(
                        title: "New Password",
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
                            borderRadius: BorderRadius.circular(Sizes.dimen_5),
                            borderSide: const BorderSide(
                                width: 2, color: ColorConsts.whiteLilac),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Sizes.dimen_5),
                            borderSide: const BorderSide(
                                width: 2, color: ColorConsts.whiteLilac),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Sizes.dimen_5),
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
                        title: "Confirm Password",
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
                            borderRadius: BorderRadius.circular(Sizes.dimen_5),
                            borderSide: const BorderSide(
                                width: 2, color: ColorConsts.whiteLilac),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Sizes.dimen_5),
                            borderSide: const BorderSide(
                                width: 2, color: ColorConsts.whiteLilac),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Sizes.dimen_5),
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
                  CustomRaisedButton(
                      text: const Text(
                        'CONFIRM',
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
                          if (formKey.currentState!.validate()) {}
                        }
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
