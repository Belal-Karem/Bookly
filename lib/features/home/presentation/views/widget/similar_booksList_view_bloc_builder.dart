import 'package:bookly/features/home/presentation/views/widget/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helper_function/get_dummy_book.dart';
import '../../../../../core/widget/custom_error_widget.dart';
import '../../manger/similar_book_cubit/similar_book_cubit.dart';

class SimilarBooksListViewBlocBuilder extends StatelessWidget {
  const SimilarBooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookCubit, SimilarBookState>(
      builder: (context, state) {
        if (state is SimilarBookSuccess) {
          return SimilarBooksListView(books: state.books);
        } else if (state is SimilarBookFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return Skeletonizer(
            child: SimilarBooksListView(books: dummyBooksList),
          );
        }
      },
    );
  }
}
