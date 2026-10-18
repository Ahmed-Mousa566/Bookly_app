import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/Home/data/repos/home_repo_implement.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<ApiService>(  ApiService());

  getIt.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(apiService: getIt.get<ApiService>()),
  );
}
