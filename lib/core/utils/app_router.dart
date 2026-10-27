import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/Home/data/model/book_model.dart';
import 'package:bookly_app/features/Home/data/repos/home_repo_implement.dart';
import 'package:bookly_app/features/Home/presentaion/manger/similler_book/similler_book_cubit.dart';
import 'package:bookly_app/features/Home/presentaion/views/book_details_view.dart';
import 'package:bookly_app/features/Home/presentaion/views/book_reader_view.dart';
import 'package:bookly_app/features/Home/presentaion/views/home_view.dart';
import 'package:bookly_app/features/search/presentaion/views/search_view.dart';
import 'package:bookly_app/features/splach/presentaion/views/splach.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetails = '/bookDetails';
  static const kSearchView = '/SerchView';
  static const kBookReaderView = '/BookReaderView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplachView()),

      GoRoute(path: kHomeView, builder: (context, state) => HomeView()),

      GoRoute(
        path: kBookDetails,

        builder: (context, state) {
          final bookModel = state.extra as BookModel;
          return BlocProvider(
            create: (context) =>
                SimillerBookCubit(getIt.get<HomeRepoImplement>())
                  ..fetchSimillerBooks(bookModel),
            child: BookDetailsView(bookModel: bookModel),
          );
        },
      ),

      GoRoute(path: kSearchView, builder: (context, state) => SearchView()),

      GoRoute(
        path: kBookReaderView,
        builder: (context, state) {
          final bookModel = state.extra as BookModel;

          return BookReaderViewBody(bookModel: bookModel);
        },
      ),
    ],
  );
}
