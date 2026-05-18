import 'package:bookly/core/helper_function/get_dummy_book.dart';
import 'package:bookly/features/home/presentation/views/widget/featured_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widget/custom_error_widget.dart';
import '../../manger/featured_book_cubit/featured_book_cubit.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return FeaturedBooksListView(books: state.books);
        } else if (state is FeaturedBookFailuer) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return Skeletonizer(
            child: FeaturedBooksListView(books: dummyBooksList),
          );
        }
      },
    );
  }
}
