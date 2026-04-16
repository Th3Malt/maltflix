abstract class IMovieDatasource {
  Future<String> getNowPlaying(int page);
  Future<String> getPopular(int page);

  Future<String> getMovieDetails(int id);
}
