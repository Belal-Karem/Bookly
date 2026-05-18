import 'package:bookly/constants.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widget/best_seller_list_view_item.dart';
import 'package:flutter/widgets.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key, required this.books});

  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    final ratingProvider = AverageRating();
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: books.length,
      itemBuilder: (context, index) {
        final ratingData =
            index < ratingProvider.mockBooks.length
                ? ratingProvider.mockBooks[index]
                : {'averageRating': 0.0, 'ratingsCount': 0};

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BestSellerListViewItem(
            bookModel: books[index],
            rating: ratingData['averageRating'],
            count: ratingData['ratingsCount'],
          ),
        );
      },
    );
  }
}
