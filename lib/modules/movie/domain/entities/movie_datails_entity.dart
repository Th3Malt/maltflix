class MovieDetailsEntity {
  final bool adult;
  final String? backdropPath;
  final CollectionEntity? belongsToCollection;
  final int budget;
  final List<GenreEntity> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompanyEntity> productionCompanies;
  final List<ProductionCountryEntity> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguageEntity> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieDetailsEntity({
    required this.adult,
    this.backdropPath,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
}

class GenreEntity {
  final int id;
  final String name;

  GenreEntity({required this.id, required this.name});
}

class ProductionCompanyEntity {
  final int id;
  final String name;
  final String? logoPath;
  final String originCountry;

  ProductionCompanyEntity({
    required this.id,
    required this.name,
    this.logoPath,
    required this.originCountry,
  });
}

class ProductionCountryEntity {
  final String iso31661;
  final String name;

  ProductionCountryEntity({required this.iso31661, required this.name});
}

class SpokenLanguageEntity {
  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguageEntity({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });
}

class CollectionEntity {
  final int id;
  final String name;
  final String? posterPath;
  final String? backdropPath;

  CollectionEntity({
    required this.id,
    required this.name,
    this.posterPath,
    this.backdropPath,
  });
}
