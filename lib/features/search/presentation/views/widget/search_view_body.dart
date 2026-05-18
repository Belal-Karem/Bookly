import 'package:bookly/core/utils/style.dart';
import 'package:bookly/core/widget/custom_app_bar.dart';
import 'package:bookly/core/widget/custom_search_text_field.dart';
import 'package:bookly/features/home/presentation/manger/search_book_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import 'search_result_list_view_bloc_builder.dart';

class SearchViewbody extends StatefulWidget {
  const SearchViewbody({super.key});

  @override
  State<SearchViewbody> createState() => _SearchViewbodyState();
}

class _SearchViewbodyState extends State<SearchViewbody> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: khomepaddingfromlift,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            icon: FontAwesomeIcons.arrowRight,
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          CustomSeatchTextField(
            onChanged: (value) {
              searchQuery = value;
            },
            onPressed: () {
              context.read<SearchCubit>().fetchSearchBooks(search: searchQuery);
            },
          ),
          const SizedBox(height: 20),
          const Text('Search Result', style: Style.textStyle18),
          const SizedBox(height: 8),
          SearchResultListViewBlocBuilder(),
        ],
      ),
    );
  }
}
