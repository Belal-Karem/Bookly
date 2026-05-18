import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:bookly/features/home/presentation/views/widget/best_seller_list_view.dart';
import 'package:bookly/core/widget/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widget/featured_books_list_view.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: khomepaddingfromlift,
                child: CustomAppBar(
                  icon: FontAwesomeIcons.magnifyingGlass,
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.ksearchView);
                  },
                ),
              ),
              const FeaturedBooksListView(),
              const SizedBox(height: 50),
              const Padding(
                padding: khomepaddingfromlift,
                child: Text('Newset Books', style: Style.textStyle18),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: khomepaddingfromlift,
            child: BestSellerListView(),
          ),
        ),
      ],
    );
  }
}
