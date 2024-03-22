import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton({
    super.key,
    required this.text,
    this.height,
    this.width,
    this.onPressed,
    this.borderRadius,
    this.color,
    this.gradient,
  });

  final double? height;
  final double? width;
  final VoidCallback? onPressed;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final Text text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: color ?? const Color(0xFF00ACE9),
      borderRadius: borderRadius ?? BorderRadius.circular(8),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: height ?? 48,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            color: color ?? const Color(0xFF00ACE9),
            borderRadius: borderRadius ?? BorderRadius.circular(8),
            gradient: gradient ??
                const LinearGradient(
                  colors: [
                    Color(0xFF00ACE9),
                    Color(0xFF0095E9),
                  ],
                ),
            boxShadow: [
              BoxShadow(
                color: color ?? const Color(0xFF00ACE9).withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Center(
            child: text,
          ),
        ),
      ),
    );
  }
}
