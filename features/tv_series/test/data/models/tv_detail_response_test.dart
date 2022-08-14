import 'package:common/data/models/genre_model.dart';
import 'package:common/data/models/movie_table.dart';
import 'package:common/data/models/movie_type.dart';
import 'package:common/presentation/common/genre.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/data/models/tv_detail_model.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';
import 'package:tv_series/domain/mapper/movie_table_mapper.dart';

void main() {
  final tTvDetailResponse = TvDetailResponse(
    backdropPath: "backdropPath",
    createdBy: [
      CreatedByModel(
        id: 12345,
        creditId: "creditId",
        name: "name",
        gender: 1,
        profilePath: "profilePath",
      )
    ],
    episodeRunTime: [10],
    firstAirDate: "firstAirDate",
    genres: [
      GenreModel(id: 123, name: "genre"),
    ],
    homepage: "homepage",
    id: 7890,
    inProduction: false,
    languages: ["en"],
    lastAirDate: "lastAirDate",
    lastEpisodeToAir: LastEpisodeModel(
      airDate: "airDate",
      episodeNumber: 10,
      id: 159,
      name: "name",
      overview: "overview",
      productionCode: "productionCode",
      seasonNumber: 1,
      stillPath: "stillPath",
      voteAverage: 10.0,
      voteCount: 1000,
    ),
    name: "name",
    numberOfEpisodes: 10,
    numberOfSeasons: 1,
    originLanguage: "en",
    originalName: "originalName",
    overview: "overview",
    popularity: 10.0,
    posterPath: "posterPath",
    productionCompanies: [
      ProductionCompanyModel(
        id: 246,
        logoPath: "logoPath",
        name: "name",
        originCountry: "originCountry",
      ),
    ],
    seasons: [
      SeasonModel(
        airDate: "airDate",
        episodeCount: 10,
        id: 357,
        name: "name",
        overview: "overview",
        posterPath: "posterPath",
        seasonNumber: 1,
      ),
    ],
    status: "status",
    tagline: "tagline",
    type: "type",
    voteAverage: 10.0,
    voteCount: 1000,
  );

  final tTvDetailEntity = TvDetail(
    backdropPath: "backdropPath",
    createdBy: [
      CreatedBy(
        id: 12345,
        creditId: "creditId",
        name: "name",
        gender: 1,
        profilePath: "profilePath",
      ),
    ],
    episodeRunTime: [10],
    firstAirDate: "firstAirDate",
    genres: [Genre(id: 123, name: "genre")],
    homepage: "homepage",
    id: 7890,
    inProduction: false,
    languages: ["en"],
    lastAirDate: "lastAirDate",
    lastEpisodeToAir: LastEpisode(
      airDate: "airDate",
      episodeNumber: 10,
      id: 159,
      name: "name",
      overview: "overview",
      productionCode: "productionCode",
      seasonNumber: 1,
      stillPath: "stillPath",
      voteAverage: 10.0,
      voteCount: 1000,
    ),
    name: "name",
    numberOfEpisodes: 10,
    numberOfSeasons: 1,
    originLanguage: "en",
    originalName: "originalName",
    overview: "overview",
    popularity: 10.0,
    posterPath: "posterPath",
    productionCompanies: [
      ProductionCompany(
        id: 246,
        logoPath: "logoPath",
        name: "name",
        originCountry: "originCountry",
      ),
    ],
    seasons: [
      Season(
        airDate: "airDate",
        episodeCount: 10,
        id: 357,
        name: "name",
        overview: "overview",
        posterPath: "posterPath",
        seasonNumber: 1,
      ),
    ],
    status: "status",
    tagline: "tagline",
    type: "type",
    voteAverage: 10.0,
    voteCount: 1000,
  );

  final tMovieTableTv = MovieTable(
      id: 123,
      title: "title",
      posterPath: "posterPath",
      overview: "overview",
      movieType: MovieType.tv);

  group("TV Detail Response", () {
    test("fromJson", () {
      // arrange
      final json = {
        "backdrop_path": "backdropPath",
        "created_by": [
          {
            "id": 12345,
            "name": "name",
            "gender": 1,
            "credit_id": "creditId",
            "profile_path": "profilePath",
          }
        ],
        "episode_run_time": [10],
        "first_air_date": "firstAirDate",
        "genres": [
          {
            "id": 123,
            "name": "genre",
          }
        ],
        "homepage": "homepage",
        "id": 7890,
        "in_production": false,
        "languages": ["en"],
        "last_air_date": "lastAirDate",
        "last_episode_to_air": {
          "air_date": "airDate",
          "episode_number": 10,
          "id": 159,
          "name": "name",
          "overview": "overview",
          "production_code": "productionCode",
          "season_number": 1,
          "still_path": "stillPath",
          "vote_average": 10.0,
          "vote_count": 1000,
        },
        "name": "name",
        "number_of_episodes": 10,
        "number_of_seasons": 1,
        "original_language": "en",
        "original_name": "originalName",
        "overview": "overview",
        "popularity": 10.0,
        "poster_path": "posterPath",
        "production_companies": [
          {
            "id": 246,
            "logo_path": "logoPath",
            "name": "name",
            "origin_country": "originCountry",
          },
        ],
        "seasons": [
          {
            "air_date": "airDate",
            "episode_count": 10,
            "id": 357,
            "name": "name",
            "overview": "overview",
            "poster_path": "posterPath",
            "season_number": 1,
          }
        ],
        "status": "status",
        "tagline": "tagline",
        "type": "type",
        "vote_average": 10.0,
        "vote_count": 1000
      };

      // act
      final result = TvDetailResponse.fromJson(json);

      // assert
      expect(result, tTvDetailResponse);
    });

    test("fromJson", () {
      // arrange

      // act
      final result = tTvDetailResponse.toEntity();

      // assert
      expect(result, tTvDetailEntity);
    });
  });

  test("to Movie Table", () {
    // arrange
    final tvDetail = TvDetail(
      createdBy: [],
      episodeRunTime: [],
      genres: [],
      languages: [],
      productionCompanies: [],
      seasons: [],
      overview: "overview",
      posterPath: "posterPath",
      name: "title",
      id: 123,
    );

    // act
    final result = MovieTableMapper.mapTvDetailToMovieTable(tvDetail);

    // assert
    expect(result, tMovieTableTv);
  });
}
