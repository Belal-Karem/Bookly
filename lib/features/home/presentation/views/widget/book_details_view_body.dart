import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widget/book_details_section.dart';
import 'package:bookly/features/home/presentation/views/widget/books_action.dart';
import 'package:bookly/features/home/presentation/views/widget/custom_book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widget/similar_book_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(bookModel: bookModel),
                const SizedBox(height: 37),
                BooksAction(),
                Expanded(child: SizedBox(height: 50)),
                SimilarBookSection(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
