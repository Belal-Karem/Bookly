import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/splash/presentation/view/widget/sliding_image.dart';
import 'package:bookly/features/splash/presentation/view/widget/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> textSlidingAnimation;
  late Animation<Offset> imageSlidingAnimation;
  @override
  void initState() {
    super.initState();

    initSlifingAnimation();

    navigeteToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlidingImage(slidingAnimation: imageSlidingAnimation),
        slidingText(slidingAnimation: textSlidingAnimation),
      ],
    );
  }

  void initSlifingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    textSlidingAnimation = Tween<Offset>(
      begin: Offset(0, 21),
      end: Offset.zero,
    ).animate(animationController);

    imageSlidingAnimation = Tween<Offset>(
      begin: Offset(0, -6),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }

  void navigeteToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.khomeView);
    });
  }
}
