import 'package:animated_weight_picker/animated_weight_picker.dart';
import 'package:flutter/material.dart';

class CustomAnimatedWeight extends StatefulWidget {
  final double min;
  final double max;
  final Function onChange;

  const CustomAnimatedWeight(
      {super.key,
      required this.min,
      required this.max,
      required this.onChange});

  @override
  State<StatefulWidget> createState() => _CustomAnimatedWeightState();
}

class _CustomAnimatedWeightState extends State<CustomAnimatedWeight> {
  @override
  Widget build(BuildContext context) {
    return AnimatedWeightPicker(
      min: widget.min,
      max: widget.max,
      onChange: (value) => widget.onChange(value),
    );
  }
}
