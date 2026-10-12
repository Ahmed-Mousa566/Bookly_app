import 'package:bookly_app/features/Home/presentaion/views/home_view.dart';
import 'package:bookly_app/features/splach/presentaion/views/splach.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplachView()),

      GoRoute(path: kHomeView, builder: (context, state) => HomeView()),
    ],
  );
}
