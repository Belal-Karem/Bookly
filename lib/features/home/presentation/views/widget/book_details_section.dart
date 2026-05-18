import 'package:bookly/core/utils/style.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widget/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widget/custom_book_item.dart';
import 'package:flutter/widgets.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.17),
          child: CustomBookItem(
            imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
          ),
        ),
        const SizedBox(height: 43),
        Text(
          bookModel.volumeInfo.title ?? '',
          style: Style.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors != null &&
                    bookModel.volumeInfo.authors!.isNotEmpty
                ? bookModel.volumeInfo.authors![0]
                : 'Not known',
            style: Style.textStyle18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 18),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          count: 1,
          rating: 1,
        ),
      ],
    );
  }
}
