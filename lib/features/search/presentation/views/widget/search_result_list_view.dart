import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/search/presentation/views/widget/search_result_list_view_item.dart';
import 'package:flutter/widgets.dart';

import '../../../../../constants.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.bookModel});

  final List<BookModel> bookModel;

  @override
  Widget build(BuildContext context) {
    final ratingProvider = AverageRating();
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 20,
      itemBuilder: (context, index) {
        final ratingData =
            index < ratingProvider.mockBooks.length
                ? ratingProvider.mockBooks[index]
                : {'averageRating': 0.0, 'ratingsCount': 0};
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: SearchResultListViewItem(
            bookModel: bookModel[index],
            rating: ratingData['averageRating'],
            count: ratingData['ratingsCount'],
          ),
        );
      },
    );
  }
}
