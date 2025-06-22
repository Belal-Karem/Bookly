import 'package:bookly/core/utils/style.dart';
import 'package:bookly/features/search/presentation/view_model/views/widget/custom_search_text_field.dart';
import 'package:bookly/features/search/presentation/view_model/views/widget/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchViewbody extends StatelessWidget {
  const SearchViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSeatchTextField(),
          SizedBox(height: 20),
          Text('Search Result', style: Style.textStyle18),
          SizedBox(height: 8),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
