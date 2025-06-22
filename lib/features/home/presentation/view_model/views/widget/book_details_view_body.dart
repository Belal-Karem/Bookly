import 'package:bookly/features/home/presentation/view_model/views/widget/book_details_section.dart';
import 'package:bookly/features/home/presentation/view_model/views/widget/books_action.dart';
import 'package:bookly/features/home/presentation/view_model/views/widget/custom_book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/view_model/views/widget/similar_book_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: const [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                CustomBookDetailsAppBar(),
                BookDetailsSection(),
                SizedBox(height: 37),
                BooksAction(),
                Expanded(child: SizedBox(height: 50)),
                SimilarBookSection(),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
