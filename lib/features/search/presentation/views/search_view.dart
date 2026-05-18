import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/model/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/manger/search_book_cubit/search_cubit.dart';
import 'package:bookly/features/search/presentation/views/widget/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SearchCubit(getit.get<HomeRepoImpl>()),
          child: const SearchViewbody(),
        ),
      ),
    );
  }
}
