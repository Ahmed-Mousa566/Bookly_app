import 'package:bookly_app/features/Home/presentaion/views/book_details_view.dart';
import 'package:bookly_app/features/Home/presentaion/views/home_view.dart';
import 'package:bookly_app/features/search/presentaion/views/search_view.dart';
import 'package:bookly_app/features/splach/presentaion/views/splach.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetails = '/bookDetails';
  static const kSearchView = '/SerchView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplachView()),

      GoRoute(path: kHomeView, builder: (context, state) => HomeView()),

      GoRoute(
        path: kBookDetails,
        builder: (context, state) => BookDetailsView(),
      ),

      GoRoute(path: kSearchView, builder: (context, state) => SearchView()),

    ],
  );
}
