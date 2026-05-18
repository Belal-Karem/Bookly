import 'package:bookly/core/widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_loading_animation/shimmer_loading_animation.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: CustomBookImage(imageUrl: imageUrl ?? ''),
        ),
      ),
    );
  }
}
