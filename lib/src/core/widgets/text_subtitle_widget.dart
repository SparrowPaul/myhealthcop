import 'package:flutter/material.dart';

import '../constants/size_consts.dart';

class TextSubtitleWidget extends StatelessWidget {
  final String title;

  const TextSubtitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: Sizes.dimen_16, fontWeight: FontWeight.w500),
    );
  }
}