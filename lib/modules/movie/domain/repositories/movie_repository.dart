import 'package:maltflix/app_imports.dart';

abstract class IMovieRepository {
  Future<List<MovieEntity>> getNowPlaying(int page);
  Future<List<MovieEntity>> getPopular(int page);

  Future<MovieDetailsEntity> getMovieDetails(int id);
}
