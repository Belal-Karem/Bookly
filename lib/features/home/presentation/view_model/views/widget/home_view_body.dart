import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:bookly/features/home/presentation/view_model/views/widget/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/view_model/views/widget/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/view_model/views/widget/featured_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(padding: khomepaddingfromlift, child: CustomAppBar()),
              FeaturedBooksListView(),
              SizedBox(height: 50),
              Padding(
                padding: khomepaddingfromlift,
                child: Text('Best Seller', style: Style.textStyle18),
              ),
              SizedBox(height: 20),
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
