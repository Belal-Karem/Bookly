import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widget/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({
    super.key,
    required this.bookModel,
    required this.rating,
    required this.count,
  });

  final BookModel bookModel;
  final double rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kbookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: CustomBookImage(
                imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
              ),
            ),
            SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Style.textStyle20.copyWith(
                        fontFamily: kGTsectrafine,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    bookModel.volumeInfo.authors != null &&
                            bookModel.volumeInfo.authors!.isNotEmpty
                        ? bookModel.volumeInfo.authors![0]
                        : 'Not known',
                    style: Style.textstyle14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Style.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(rating: rating, count: count),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
