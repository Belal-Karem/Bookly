import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Row(
        children: [
          Image.asset(AssetsData.logo, height: 30),
          const Spacer(),
          IconButton(onPressed: onPressed, icon: Icon(icon, size: 30)),
        ],
      ),
    );
  }
}
