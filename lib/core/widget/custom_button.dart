import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textcolor,
    this.borderRadius = BorderRadius.zero,
    required this.text,
  });

  final String text;
  final Color backgroundColor;
  final Color textcolor;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        onPressed: () {},
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
