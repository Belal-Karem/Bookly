import 'package:bookly/core/widget/custom_error_widget.dart';
import 'package:bookly/core/widget/custom_loding_indicator.dart';
import 'package:bookly/features/home/presentation/manger/similar_book_cubit/similar_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/widget/custom_book_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookCubit, SimilarBookState>(
      builder: (context, state) {
        if (state is SimilarBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookItem(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks.thumbnail,
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBookFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return CustomLodingIndicator();
        }
      },
    );
  }
}
