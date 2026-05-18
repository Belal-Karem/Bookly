import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSeatchTextField extends StatelessWidget {
  const CustomSeatchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
        enabledBorder: BuildOutlineInputBorder(),
        focusedBorder: BuildOutlineInputBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {},
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
