import 'package:bookly/features/home/presentation/views/widget/best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helper_function/get_dummy_book.dart';
import '../../../../../core/widget/custom_error_widget.dart';
import '../../manger/newset_book_cubit/newset_book_cubit.dart';

class BestSellerListViewBlocBuilder extends StatelessWidget {
  const BestSellerListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBookCubit, NewsetBookState>(
      builder: (context, state) {
        if (state is NewsetBookSuccess) {
          return BestSellerListView(books: state.books);
        } else if (state is NewsetBookFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return Expanded(
            child: Skeletonizer(
              child: BestSellerListView(books: dummyBooksList),
            ),
          );
        }
      },
    );
  }
}
