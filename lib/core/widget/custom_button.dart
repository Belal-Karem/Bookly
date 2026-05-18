import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textcolor,
    this.borderRadius = BorderRadius.zero,
    required this.text,
    this.onPressed,
  });

  final String text;
  final Color backgroundColor;
  final Color textcolor;
  final BorderRadiusGeometry borderRadius;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Style.textStyle18.copyWith(
            color: textcolor,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
