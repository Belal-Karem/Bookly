import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSeatchTextField extends StatelessWidget {
  const CustomSeatchTextField({
    super.key,
    required this.onPressed,
    this.onChanged,
  });

  final void Function() onPressed;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        enabledBorder: BuildOutlineInputBorder(),
        focusedBorder: BuildOutlineInputBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Opacity(
            opacity: .7,
            child: Icon(FontAwesomeIcons.magnifyingGlass, size: 25),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder BuildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
