import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomLodingIndicator extends StatelessWidget {
  const CustomLodingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: const CircularProgressIndicator());
  }
}
