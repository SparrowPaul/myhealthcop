import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../constants/size_consts.dart';

class CustomPhoneNumberField extends StatelessWidget {
  final String? hintText;
  final Text label;
  final Function validator;
  final Function onInputChanged;

  const CustomPhoneNumberField(
      {super.key,
      required this.label,
      this.hintText,
      required this.validator,
      required this.onInputChanged});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label,
        Container(
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              InternationalPhoneNumberInput(
                // style: const TextStyle(color: primaryHighlightColor),
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  showFlags: true,
                  useEmoji: false,

                  useBottomSheetSafeArea: true,
                  // backgroundColor,
                  // countryComparator,
                  setSelectorButtonAsPrefixIcon: false,
                ),
                inputDecoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: const Color(0xFFF4F5FB),
                  enabled: true,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: const OutlineInputBorder(
                      // borderSide: BorderSide(color: warningColor),
                      ),
                  // errorStyle: TextStyle(color: warningColor),
                  focusedErrorBorder: const OutlineInputBorder(
                      // borderSide: BorderSide(color: warningColor),
                      ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: Sizes.dimen_16, vertical: 0),
                ),
                validator: (value) => validator(value),
                onInputChanged: (PhoneNumber number) => onInputChanged(number),
                onInputValidated: (bool value) {
                  print(value);
                },
                // selectorConfig: const SelectorConfig(
                //   selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                //   useBottomSheetSafeArea: true,
                // ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(color: Colors.black),
                // initialValue: number,
                // textFieldController: controller,
                formatInput: true,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: const OutlineInputBorder(),
                onSaved: (PhoneNumber number) {
                  print('On Saved: $number');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
