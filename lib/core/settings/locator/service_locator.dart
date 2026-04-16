import 'package:maltflix/app_imports.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
GetIt get locator => ServiceLocator.locator;

class ServiceLocator {
  ServiceLocator._();

  static GetIt get locator => GetIt.instance;

  static Future<void> setupServiceLocator() async {
    await _registerServices();
    _registerExternal();
    _registerInfra();
    _registerPresenter();
  }

  static Future<void> _registerServices() async {
    GetIt.I.registerSingleton<Dio>(DioFactory.create());
    GetIt.I.registerSingleton<IHttpService>(HttpDioService(locator()));
  }

  static void _registerExternal() async {
    GetIt.I.registerLazySingleton<IMovieDatasource>(
      () => MovieDatasourceImp(locator()),
    );
  }

  static void _registerInfra() async {
    GetIt.I.registerLazySingleton<IMovieRepository>(
      () => MovieRepositoryImp(locator()),
    );
  }

  static void _registerPresenter() async {
    GetIt.I.registerLazySingleton<NowPlayingCubit>(
      () => NowPlayingCubit(locator()),
    );

    GetIt.I.registerLazySingleton<PopularMoviesCubit>(
      () => PopularMoviesCubit(locator()),
    );

    GetIt.I.registerFactory<MovieCubit>(() => MovieCubit(locator()));
  }
}
