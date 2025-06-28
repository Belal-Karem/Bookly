import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widget/custom_error_widget.dart';
import 'package:bookly/core/widget/custom_loding_indicator.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/manger/featured_book_cubit/featured_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/widget/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kbookDetailsView,
                        extra: state.books[index],
                      );
                    },
                    child: CustomBookItem(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks.thumbnail,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBookFailuer) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return CustomLodingIndicator();
        }
      },
    );
  }
}
