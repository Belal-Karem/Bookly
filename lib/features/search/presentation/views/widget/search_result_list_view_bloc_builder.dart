import 'package:bookly/core/helper_function/get_dummy_book.dart';
import 'package:bookly/features/home/presentation/manger/search_book_cubit/search_cubit.dart';
import 'package:bookly/features/search/presentation/views/widget/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widget/custom_error_widget.dart';

class SearchResultListViewBlocBuilder extends StatelessWidget {
  const SearchResultListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return Expanded(child: SearchResultListView(bookModel: state.books));
        } else if (state is SearchFailuer) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return Expanded(
            child: Skeletonizer(
              child: SearchResultListView(bookModel: dummyBooksList),
            ),
          );
        }
      },
    );
  }
}
