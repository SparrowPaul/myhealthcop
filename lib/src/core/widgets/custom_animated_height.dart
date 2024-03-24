import 'package:animated_weight_picker/animated_weight_picker.dart';
import 'package:flutter/material.dart';

class CustomAnimatedHeight extends StatefulWidget {
  final double min;
  final double max;
  final Function onChange;

  const CustomAnimatedHeight(
      {super.key,
      required this.min,
      required this.max,
      required this.onChange});

  @override
  State<StatefulWidget> createState() => _CustomAnimatedHeightState();
}

class _CustomAnimatedHeightState extends State<CustomAnimatedHeight> {
  @override
  Widget build(BuildContext context) {
    return AnimatedWeightPicker(
      suffixText: "cm",
      min: widget.min,
      max: widget.max,
      onChange: (value) => widget.onChange(value),
    );
  }
}
