import 'package:bookly/features/home/presentation/view_model/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/view_model/views/home_view.dart';
import 'package:bookly/features/search/presentation/view_model/views/search_view.dart';
import 'package:bookly/features/splash/pres/presentation/view_model/view/splash_view.dart';
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
        builder: (context, state) => BookDetailsView(),
      ),
      GoRoute(path: ksearchView, builder: (context, state) => SearchView()),
    ],
  );
}
