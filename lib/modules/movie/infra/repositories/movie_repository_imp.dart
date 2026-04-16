import 'dart:convert';

import 'package:maltflix/app_imports.dart';

class MovieRepositoryImp implements IMovieRepository {
  final IMovieDatasource datasource;

  MovieRepositoryImp(this.datasource);
  @override
  Future<List<MovieEntity>> getNowPlaying(int page) async {
    try {
      final response = await datasource.getNowPlaying(page);
      final movies = MovieMapper.fromJsonList(response);
      return movies;
    } catch (e) {
      if (e is IDefaultException) {
        rethrow;
      } else {
        throw MovieInfraException(e);
      }
    }
  }

  @override
  Future<List<MovieEntity>> getPopular(int page) async {
    try {
      final response = await datasource.getPopular(page);
      final movies = MovieMapper.fromJsonList(response);
      return movies;
    } catch (e) {
      if (e is IDefaultException) {
        rethrow;
      } else {
        throw MovieInfraException(e);
      }
    }
  }

  @override
  Future<MovieDetailsEntity> getMovieDetails(int id) async {
    try {
      final response = await datasource.getMovieDetails(id);
      final movieDetails = MovieDetailsMapper.fromJson(jsonDecode(response));
      return movieDetails;
    } catch (e) {
      if (e is IDefaultException) {
        rethrow;
      } else {
        throw MovieInfraException(e);
      }
    }
  }
}
