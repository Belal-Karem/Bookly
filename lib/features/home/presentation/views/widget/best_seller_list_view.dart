import 'package:bookly/constants.dart';
import 'package:bookly/core/widget/custom_error_widget.dart';
import 'package:bookly/core/widget/custom_loding_indicator.dart';
import 'package:bookly/features/home/presentation/manger/newset_book_cubit/newset_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/widget/best_seller_list_view_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    final ratingProvider = AverageRating();

    return BlocBuilder<NewsetBookCubit, NewsetBookState>(
      builder: (context, state) {
        if (state is NewsetBookSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              final ratingData =
                  index < ratingProvider.mockBooks.length
                      ? ratingProvider.mockBooks[index]
                      : {'averageRating': 0.0, 'ratingsCount': 0};

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(
                  bookModel: state.books[index],
                  rating: ratingData['averageRating'],
                  count: ratingData['ratingsCount'],
                ),
              );
            },
          );
        } else if (state is NewsetBookFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return CustomLodingIndicator();
        }
      },
    );
  }
}
