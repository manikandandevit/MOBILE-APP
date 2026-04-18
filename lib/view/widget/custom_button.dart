import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double buttonHeight;
  final double buttonWidth;
  final String? text; // 👈 nullable
  final TextStyle? style;
  final Color? color;
  final BoxBorder? border;
  final bool isLoading; // 👈 NEW

  const CustomButton({
    super.key,
    required this.buttonWidth,
    required this.buttonHeight,
    this.text,
    this.style,
    this.color,
    this.border,
    this.isLoading = false, // 👈 default false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      width: buttonWidth,
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: Center(
        child: isLoading
            ? const SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        )
            : Text(
          text ?? '',
          style: style,
        ),
      ),
    );
  }
}