import 'dart:convert';

import 'package:maltflix/modules/movie/domain/domain.dart';

class MovieMapper {
  static MovieEntity fromMap(Map<String, dynamic> map) {
    return MovieEntity(
      id: map['id'],
      title: map['title'],
      overview: map['overview'],
      posterPath: map['poster_path'],
      releaseDate: map['release_date'],
      adult: map['adult'],
      backdropPath: map['backdrop_path'],
      genreIds: List<int>.from(map['genre_ids']),
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      popularity: map['popularity'].toDouble(),
      video: map['video'],
      voteAverage: map['vote_average'].toDouble(),
      voteCount: map['vote_count'],
    );
  }

  static List<MovieEntity> fromList(List<dynamic> list) {
    return list.map((item) => fromMap(item)).toList();
  }

  static List<MovieEntity> fromJsonList(String json) {
    final Map<String, dynamic> decoded = jsonDecode(json);
    final List<dynamic> results = decoded['results'];
    return fromList(results);
  }
}
