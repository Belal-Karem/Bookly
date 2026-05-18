import 'package:bookly/core/utils/style.dart';
import 'package:flutter/widgets.dart';
import 'similar_booksList_view_bloc_builder.dart';

class SimilarBookSection extends StatelessWidget {
  const SimilarBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Style.textstyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        const SimilarBooksListViewBlocBuilder(),
      ],
    );
  }
}
