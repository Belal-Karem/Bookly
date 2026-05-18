import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/presentation/views/widget/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../data/model/book_model/book_model.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(
                  context,
                ).push(AppRouter.kbookDetailsView, extra: books[index]);
              },
              child: CustomBookItem(
                imageUrl: books[index].volumeInfo.imageLinks.thumbnail,
              ),
            ),
          );
        },
      ),
    );
  }
}
