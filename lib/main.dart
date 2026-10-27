import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/bloc_observer.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/Home/data/repos/home_repo_implement.dart';
import 'package:bookly_app/features/Home/presentaion/manger/featured_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/Home/presentaion/manger/newest_cubit/newest_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setup();
  runApp(const BookliApp());
}

class BookliApp extends StatelessWidget {
  const BookliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImplement>())
                ..fetchFeaturedBook(),
        ),

        BlocProvider(
          create: (context) =>
              NewestBookCubit(getIt.get<HomeRepoImplement>())
                ..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
