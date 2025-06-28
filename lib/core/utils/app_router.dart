import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/data/model/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/manger/similar_book_cubit/similar_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:bookly/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const khomeView = '/homeView';
  static const kbookDetailsView = '/bookDetailsView';
  static const ksearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: khomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kbookDetailsView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => SimilarBookCubit(getit.get<HomeRepoImpl>()),
              child: BookDetailsView(bookModel: state.extra as BookModel),
            ),
      ),
      GoRoute(
        path: ksearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
