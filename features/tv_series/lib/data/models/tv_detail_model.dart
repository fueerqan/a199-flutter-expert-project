import 'package:common/data/models/genre_model.dart';
import 'package:common/presentation/common/genre.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';

class TvDetailResponse extends Equatable {
  TvDetailResponse({
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.seasons,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  final String? backdropPath;
  final List<CreatedByModel> createdBy;
  final List<int> episodeRunTime;
  final String firstAirDate;
  final List<GenreModel> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final String lastAirDate;
  final LastEpisodeModel lastEpisodeToAir;
  final String name;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String originLanguage;
  final String originalName;
  final String overview;
  final num popularity;
  final String? posterPath;
  final List<ProductionCompanyModel> productionCompanies;
  final List<SeasonModel> seasons;
  final String status;
  final String tagline;
  final String type;
  final num voteAverage;
  final int voteCount;

  factory TvDetailResponse.fromJson(Map<String, dynamic> json) =>
      TvDetailResponse(
        backdropPath: json["backdrop_path"],
        createdBy: List<CreatedByModel>.from(json["created_by"].map(
          (e) => CreatedByModel.fromJson(e),
        )),
        episodeRunTime: List<int>.from(json["episode_run_time"].map((e) => e)),
        firstAirDate: json["first_air_date"],
        genres: List<GenreModel>.from(json["genres"].map(
          (e) => GenreModel.fromJson(e),
        )),
        homepage: json["homepage"],
        id: json["id"],
        inProduction: json["in_production"],
        languages: List<String>.from(json["languages"].map((e) => e)),
        lastAirDate: json["last_air_date"],
        lastEpisodeToAir:
            LastEpisodeModel.fromJson(json["last_episode_to_air"]),
        name: json["name"],
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        originLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"],
        posterPath: json["poster_path"],
        productionCompanies:
            List<ProductionCompanyModel>.from(json["production_companies"].map(
          (e) => ProductionCompanyModel.fromjson(e),
        )),
        seasons: List<SeasonModel>.from(json["seasons"].map(
          (e) => SeasonModel.fromJson(e),
        )),
        status: json["status"],
        tagline: json["tagline"],
        type: json["type"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
      );

  TvDetail toEntity() => TvDetail(
        backdropPath: this.backdropPath,
        createdBy: this.createdBy.map((e) => e.toEntity()).toList(),
        episodeRunTime: this.episodeRunTime,
        firstAirDate: this.firstAirDate,
        genres: List<Genre>.from(this.genres.map((e) => e.toEntity())),
        homepage: this.homepage,
        id: this.id,
        inProduction: this.inProduction,
        languages: this.languages,
        lastAirDate: this.lastAirDate,
        lastEpisodeToAir: this.lastEpisodeToAir.toEntity(),
        name: this.name,
        numberOfEpisodes: this.numberOfEpisodes,
        numberOfSeasons: this.numberOfSeasons,
        originLanguage: this.originLanguage,
        originalName: this.originalName,
        overview: this.overview,
        popularity: this.popularity,
        posterPath: this.posterPath,
        productionCompanies:
            this.productionCompanies.map((e) => e.toEntity()).toList(),
        seasons: this.seasons.map((e) => e.toEntity()).toList(),
        status: this.status,
        tagline: this.tagline,
        type: this.type,
        voteAverage: this.voteAverage,
        voteCount: this.voteCount,
      );

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

class CreatedByModel extends Equatable {
  CreatedByModel({
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
    required this.profilePath,
  });

  factory CreatedByModel.fromJson(Map<String, dynamic> json) => CreatedByModel(
        id: json["id"],
        creditId: json["credit_id"],
        name: json["name"],
        gender: json["gender"],
        profilePath: json["profile_path"],
      );

  final int id;
  final String creditId;
  final String name;
  final int gender;
  final String? profilePath;

  CreatedBy toEntity() => CreatedBy(
        id: this.id,
        creditId: this.creditId,
        name: this.name,
        gender: this.gender,
        profilePath: this.profilePath,
      );

  @override
  List<Object?> get props => [
        id,
        creditId,
        name,
        gender,
        profilePath,
      ];
}

class LastEpisodeModel extends Equatable {
  LastEpisodeModel({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.seasonNumber,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });

  final String airDate;
  final int episodeNumber;
  final int id;
  final String name;
  final String overview;
  final String productionCode;
  final int seasonNumber;
  final String? stillPath;
  final num voteAverage;
  final int voteCount;

  factory LastEpisodeModel.fromJson(Map<String, dynamic> json) =>
      LastEpisodeModel(
        airDate: json["air_date"],
        episodeNumber: json["episode_number"],
        id: json["id"],
        name: json["name"],
        overview: json["overview"],
        productionCode: json["production_code"],
        seasonNumber: json["season_number"],
        stillPath: json["still_path"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
      );

  LastEpisode toEntity() => LastEpisode(
        airDate: this.airDate,
        episodeNumber: this.episodeNumber,
        id: this.id,
        name: this.name,
        overview: this.overview,
        productionCode: this.productionCode,
        seasonNumber: this.seasonNumber,
        stillPath: this.stillPath,
        voteAverage: this.voteAverage,
        voteCount: this.voteCount,
      );

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

class ProductionCompanyModel extends Equatable {
  ProductionCompanyModel({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  factory ProductionCompanyModel.fromjson(Map<String, dynamic> json) =>
      ProductionCompanyModel(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
      );

  ProductionCompany toEntity() => ProductionCompany(
        id: this.id,
        logoPath: this.logoPath,
        name: this.name,
        originCountry: this.originCountry,
      );

  @override
  List<Object?> get props => [
        id,
        logoPath,
        name,
        originCountry,
      ];
}

class SeasonModel extends Equatable {
  SeasonModel({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
  });

  final String airDate;
  final int episodeCount;
  final int id;
  final String name;
  final String overview;
  final String? posterPath;
  final int seasonNumber;

  factory SeasonModel.fromJson(Map<String, dynamic> json) => SeasonModel(
        airDate: json["air_date"] ?? "",
        episodeCount: json["episode_count"],
        id: json["id"],
        name: json["name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        seasonNumber: json["season_number"],
      );

  Season toEntity() => Season(
        airDate: this.airDate,
        episodeCount: this.episodeCount,
        id: this.id,
        name: this.name,
        overview: this.overview,
        posterPath: this.posterPath,
        seasonNumber: this.seasonNumber,
      );

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
