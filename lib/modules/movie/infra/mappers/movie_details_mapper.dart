import 'package:maltflix/app_imports.dart';

class MovieDetailsMapper {
  static MovieDetailsEntity fromJson(Map<String, dynamic> json) {
    return MovieDetailsEntity(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
      adult: json['adult'],
      budget: json['budget'],
      genres: (json['genres'] as List)
          .map((genre) => GenreEntity(id: genre['id'], name: genre['name']))
          .toList(),
      homepage: json['homepage'],
      imdbId: json['imdb_id'],
      originCountry: List<String>.from(json['origin_country'] ?? []),
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      popularity: (json['popularity'] as num).toDouble(),
      productionCompanies: (json['production_companies'] as List)
          .map(
            (company) => ProductionCompanyEntity(
              id: company['id'],
              logoPath: company['logo_path'],
              name: company['name'],
              originCountry: company['origin_country'],
            ),
          )
          .toList(),
      productionCountries: (json['production_countries'] as List)
          .map(
            (country) => ProductionCountryEntity(
              iso31661: country['iso_3166_1'],
              name: country['name'],
            ),
          )
          .toList(),
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: (json['spoken_languages'] as List)
          .map(
            (language) => SpokenLanguageEntity(
              iso6391: language['iso_639_1'],
              name: language['name'],
              englishName: language['english_name'],
            ),
          )
          .toList(),
      status: json['status'],
      tagline: json['tagline'],
      video: json['video'],
    );
  }
}
