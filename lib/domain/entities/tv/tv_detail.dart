import 'package:ditonton/domain/entities/common/genre.dart';
import 'package:equatable/equatable.dart';

class TvDetail extends Equatable {
  TvDetail({
    this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    this.firstAirDate,
    required this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    required this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    required this.productionCompanies,
    required this.seasons,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
  });

  String? backdropPath;
  List<CreatedBy> createdBy = [];
  List<int> episodeRunTime = [];
  String? firstAirDate;
  List<Genre> genres = [];
  String? homepage;
  int? id;
  bool? inProduction;
  List<String> languages = [];
  String? lastAirDate;
  LastEpisode? lastEpisodeToAir;
  String? name;
  int? numberOfEpisodes;
  int? numberOfSeasons;
  String? originLanguage;
  String? originalName;
  String? overview;
  num? popularity;
  String? posterPath;
  List<ProductionCompany> productionCompanies = [];
  List<Season> seasons = [];
  String? status;
  String? tagline;
  String? type;
  num? voteAverage;
  int? voteCount;

  @override
  List<Object?> get props => [
        backdropPath,
        createdBy,
        episodeRunTime,
        firstAirDate,
        genres,
        homepage,
        id,
        inProduction,
        languages,
        lastAirDate,
        lastEpisodeToAir,
        name,
        numberOfEpisodes,
        numberOfSeasons,
        originLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        seasons,
        status,
        tagline,
        type,
        voteAverage,
        voteCount,
      ];
}

class CreatedBy extends Equatable {
  CreatedBy({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.profilePath,
  });

  int? id;
  String? creditId;
  String? name;
  int? gender;
  String? profilePath;

  @override
  List<Object?> get props => [
        id,
        creditId,
        name,
        gender,
        profilePath,
      ];
}

class LastEpisode extends Equatable {
  LastEpisode({
    this.airDate,
    this.episodeNumber,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.seasonNumber,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  String? airDate;
  int? episodeNumber;
  int? id;
  String? name;
  String? overview;
  String? productionCode;
  int? seasonNumber;
  String? stillPath;
  num? voteAverage;
  int? voteCount;

  @override
  List<Object?> get props => [
        airDate,
        episodeNumber,
        id,
        name,
        overview,
        productionCode,
        seasonNumber,
        stillPath,
        voteAverage,
        voteCount,
      ];
}

class ProductionCompany extends Equatable {
  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  @override
  List<Object?> get props => [
        id,
        logoPath,
        name,
        originCountry,
      ];
}

class Season extends Equatable {
  Season({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
  });

  String? airDate;
  int? episodeCount;
  int? id;
  String? name;
  String? overview;
  String? posterPath;
  int? seasonNumber;

  @override
  List<Object?> get props => [
        airDate,
        episodeCount,
        id,
        name,
        overview,
        posterPath,
        seasonNumber,
      ];
}
