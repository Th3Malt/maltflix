import 'package:maltflix/app_imports.dart';

class MovieDatasourceImp implements IMovieDatasource {
  final IHttpService httpService;

  MovieDatasourceImp(this.httpService);
  @override
  Future<String> getNowPlaying(int page) async {
    try {
      final response = await httpService.restRequest(
        url:
            'https://api.themoviedb.org/3/movie/now_playing?api_key=${Environment.apiKey}&language=pt-BR&page=$page',
        method: HttpMethodsEnum.get,
      );
      return response ?? '';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> getPopular(int page) async {
    try {
      final response = await httpService.restRequest(
        url:
            'https://api.themoviedb.org/3/movie/popular?api_key=${Environment.apiKey}&language=pt-BR&page=$page',
        method: HttpMethodsEnum.get,
      );
      return response ?? '';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> getMovieDetails(int id) async {
    try {
      final response = await httpService.restRequest(
        url:
            'https://api.themoviedb.org/3/movie/$id?api_key=${Environment.apiKey}&language=pt-BR',
        method: HttpMethodsEnum.get,
      );
      return response ?? '';
    } catch (e) {
      rethrow;
    }
  }
}
