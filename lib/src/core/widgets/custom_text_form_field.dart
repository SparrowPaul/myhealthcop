import 'package:flutter/material.dart';

import '../constants/size_consts.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String label;
  final Function validator;
  final double? height;
  final double? width;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.hintText,
    required this.validator,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: height ?? 48.0,
          child: TextFormField(
            // style: const TextStyle(color: primaryHighlightColor),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.black),
              filled: true,
              enabled: true,
              fillColor: const Color(0xFFF4F5FB),
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
          ),
        ),
      ],
    );
  }
}
