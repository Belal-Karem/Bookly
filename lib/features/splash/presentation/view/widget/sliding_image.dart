import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SlidingImage extends StatelessWidget {
  const SlidingImage({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Image.asset(AssetsData.logo),
        );
      },
    );
  }
}
