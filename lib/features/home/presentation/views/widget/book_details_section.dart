import 'package:bookly/core/utils/style.dart';
import 'package:bookly/features/home/presentation/views/widget/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widget/custom_book_item.dart';
import 'package:flutter/widgets.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.17),
          child: const CustomBookItem(
            imageUrl:
                'https://books.google.com/books/content?id=6AkgAAAAIAAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
          ),
        ),
        const SizedBox(height: 43),
        const Text('The Jungle Book', style: Style.textStyle30),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            'Rudyard Kipling',
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
